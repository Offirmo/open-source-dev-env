#! /bin/bash
## Simulates a clean provisioning: runs every 1-provisioning/ script, in numeric order, with HOME = ./home--<os>
## usage: simulate-provisioning.sh [MAX_NUMBER]   (ex. 020 = stop after the 020 scripts)
##
## goal: inspect the profile-like files (rc files…) a clean provisioning produces, WITHOUT touching the real setup.
## each script runs in a fresh login shell with an empty env = like a new terminal on a clean machine,
## so it picks up the rc files written by the previous scripts.
## commands acting outside HOME are faked: their calls are recorded for review.
## home--<os>/ is wiped at each run, logs end up in it as well
##
## ⚠️ only HOME is sandboxed, those still act on the REAL machine -> MUST be in FAKED_COMMANDS or SKIPPED_SCRIPTS:
## - brew (reachable even with a clean PATH, via /etc/paths.d/homebrew), sudo, system-wide installers
## - `defaults` (cfprefsd) and ssh/ssh-keygen (they resolve home from the uid, not from $HOME)
## - macOS Keychain (not per-HOME)

set -u

## fail fast: an empty SNAPSHOT_DIR would make SANDBOX_HOME = /home, which gets wiped
SNAPSHOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || exit 1
PROVISIONING_DIR="$(cd "$SNAPSHOT_DIR/../1-provisioning" && pwd)" || exit 1
## = the OS-specific dir in 1-provisioning/
case "$(uname)" in
	Darwin) OS_DIR_NAME=macos ;;
	Linux)  OS_DIR_NAME=ubuntu ;;
	*)      OS_DIR_NAME="" ;;
esac
SANDBOX_HOME="$SNAPSHOT_DIR/home--$OS_DIR_NAME"
FAKE_COMMANDS_LOG="$SANDBOX_HOME/fake-commands.log"
SIMULATION_LOG="$SANDBOX_HOME/simulation.log"
FAKE_BIN_DIR="$SNAPSHOT_DIR/fake-bin"
MAX_NUMBER="${1:-999}"

## git is always faked, but only for `git clone` (see fake-command.sh)
FAKED_COMMANDS=(
	brew        ## system-wide installs
	defaults    ## REAL prefs (cfprefsd)
	gh          ## may use the REAL Keychain
	llm         ## pip installs into brew's llm venv
	open        ## REAL browser tabs
	ssh-keygen  ## `-R` without `-f` edits the REAL ~/.ssh/known_hosts + generated keys = secrets in the snapshot
	sudo
	xdg-open    ## REAL browser tabs (Linux)
)

## relative to 1-provisioning/
SKIPPED_SCRIPTS=(
	macos/user--301ensure--installed--dev-env--ai.sh         ## Claude installer + plugins, may use the REAL Keychain
	macos/user--320ensure--installed--dev-env--rust.sh       ## not actively used + ~1GB toolchain would land in the snapshot
	macos/user--340ensure--installed--dev-env--java.sh       ## not actively used
	common/user--399ensure--cloned--common_offirmo_repos.sh  ## needs the ODE clone (faked) + ssh uses the REAL ~/.ssh
)

main() {
	if [ -z "$OS_DIR_NAME" ]; then
		echo "* unsupported OS: $(uname) ❌"
		exit 1
	fi
	if [[ ! "$MAX_NUMBER" =~ ^[0-9]+$ ]]; then
		echo "* MAX_NUMBER should be a number, got '$MAX_NUMBER' ❌"
		exit 1
	fi

	warn_about_stale_skip_entries "$PROVISIONING_DIR" "${SKIPPED_SCRIPTS[@]}"

	echo "* HOME = $SANDBOX_HOME"
	echo "* faked commands: git clone, ${FAKED_COMMANDS[*]} -> $FAKE_COMMANDS_LOG"
	echo "* will run, in order:"
	local scripts=()
	local script relative_path
	while IFS= read -r script; do
		relative_path="${script#"$PROVISIONING_DIR/"}"
		if is_listed "$relative_path" "${SKIPPED_SCRIPTS[@]}"; then
			echo "  - ⏭️  $relative_path (skipped)"
		else
			echo "  - $relative_path"
			scripts+=("$script")
		fi
	done < <(list_scripts_in_order "$PROVISIONING_DIR" "$OS_DIR_NAME" "$MAX_NUMBER")

	if [ ${#scripts[@]} -eq 0 ]; then
		echo "* no script to run ❌"
		exit 1
	fi

	local answer
	read -r -p "* review the list above, $SANDBOX_HOME will be WIPED, continue? [y/N] " answer
	[[ "$answer" == y ]] || exit 0

	rm -rf "${SANDBOX_HOME:?}" || exit 1
	mkdir -p "$SANDBOX_HOME"
	setup_fake_bin "$FAKE_BIN_DIR" "$SNAPSHOT_DIR/fake-command.sh" git "${FAKED_COMMANDS[@]}"

	## note: the scripts' stdout is then a pipe, not a tty
	run_scripts "$PROVISIONING_DIR" "$SANDBOX_HOME" "$FAKE_BIN_DIR" "$FAKE_COMMANDS_LOG" "${scripts[@]}" 2>&1 \
		| tee "$SIMULATION_LOG"

	## stable snapshot: `git lfs install` writes its [filter "lfs"] keys in a random order (Go map iteration)
	sort_keys_within_sections "$SANDBOX_HOME/.gitconfig"

	echo ""
	echo "* …all done ✅ inspect $SANDBOX_HOME"
}

## a renamed script would silently stop being skipped
warn_about_stale_skip_entries() {
	local provisioning_dir="$1"
	shift

	local entry
	for entry in "$@"; do
		[ -f "$provisioning_dir/$entry" ] || echo "* ⚠️ skip list entry matches no script (renamed?): $entry"
	done
}

is_listed() {
	local needle="$1"
	shift

	local item
	for item in "$@"; do
		[[ "$item" == "$needle" ]] && return 0
	done
	return 1
}

## all scripts are named user--NNN… -> sorting by basename = sorting by number, interleaving common/ and OS-specific
list_scripts_in_order() {
	local provisioning_dir="$1"
	local os_dir_name="$2"
	local max_number="$3"

	local script name
	for script in \
		"$provisioning_dir"/common/user--[0-9][0-9][0-9]*.sh \
		"$provisioning_dir/$os_dir_name"/user--[0-9][0-9][0-9]*.sh
	do
		[ -f "$script" ] || continue  ## an unmatched glob stays literal
		name="$(basename "$script")"
		(( 10#${name:6:3} <= 10#$max_number )) || continue
		printf '%s\t%s\n' "$name" "$script"
	done | LC_ALL=C sort | cut -f2
}

## re-created each run so that removing a command from the list takes effect
setup_fake_bin() {
	local fake_bin_dir="$1"
	local fake_command_script="$2"
	shift 2

	rm -rf "$fake_bin_dir"
	mkdir -p "$fake_bin_dir"
	local command_name
	for command_name in "$@"; do
		ln -s "$fake_command_script" "$fake_bin_dir/$command_name"
	done
}

run_scripts() {
	local provisioning_dir="$1"
	local sandbox_home="$2"
	local fake_bin_dir="$3"
	local fake_commands_log="$4"
	shift 4

	echo "* simulation started $(date '+%Y-%m-%d %H:%M:%S')"
	local script relative_path
	for script in "$@"; do
		relative_path="${script#"$provisioning_dir/"}"
		echo ""
		echo "* ▶️▶️▶️ $relative_path"
		echo "### $relative_path" >> "$fake_commands_log"
		run_in_sandbox "$sandbox_home" "$fake_bin_dir" "$fake_commands_log" "$script" || echo "* ↳ exit code $? ❌"
	done
}

run_in_sandbox() {
	local sandbox_home="$1"
	local fake_bin_dir="$2"
	local fake_commands_log="$3"
	local script="$4"

	## cd: some scripts write relative to cwd (ex. `git config` without --global)
	## GIT_CEILING_DIRECTORIES: the sandbox lives inside this repo, prevent git from discovering it upward
	## login shell = rc files sourced like in a new terminal, THEN the fakes are prepended
	##   (prepending before would be useless: /etc/profile's path_helper moves unknown PATH entries to the end)
	## then exec a plain bash on the script, as when typing `./script.sh` in that terminal
	# shellcheck disable=SC2016  ## $1 $2 are meant to expand in the inner shell
	(
		cd "$sandbox_home" &&
		env -i \
			HOME="$sandbox_home" \
			USER="$USER" \
			LOGNAME="${LOGNAME:-$USER}" \
			TERM="${TERM:-xterm-256color}" \
			SHELL=/bin/bash \
			PATH=/usr/bin:/bin:/usr/sbin:/sbin \
			GIT_CEILING_DIRECTORIES="$(dirname "$sandbox_home")" \
			SIMULATION__FAKE_COMMANDS_LOG="$fake_commands_log" \
			/bin/bash --login -c 'export PATH="$1:$PATH"; exec /bin/bash "$2"' _ "$fake_bin_dir" "$script"
	)
}

## sections keep their order, only the keys inside each section are sorted
## harmless for git, EXCEPT for multi-valued keys where order matters (ex. include.path): none so far
sort_keys_within_sections() {
	local file="$1"
	[ -f "$file" ] || return 0

	local line
	local section_lines=""
	{
		while IFS= read -r line || [ -n "$line" ]; do
			if [[ "$line" == \[* ]]; then
				print_sorted "$section_lines"
				section_lines=""
				printf '%s\n' "$line"
			else
				section_lines+="$line"$'\n'
			fi
		done
		print_sorted "$section_lines"
	} < "$file" > "$file.sorted" && mv "$file.sorted" "$file"
}

print_sorted() {
	local lines="$1"
	[ -n "$lines" ] || return 0

	printf '%s' "$lines" | LC_ALL=C sort
}

main
