#! /bin/bash
## Fake for a command acting outside HOME: only records the call, for review.
## invoked through a symlink named after the faked command, ex. fake-bin/brew -> fake-command.sh
## prints nothing on stdout = safe inside `$(…)` ex. `eval "$(brew shellenv)"`
## special cases:
## - git: only `git clone` is faked, the rest is passed to the real git
## - ssh-keygen: a key generation writes placeholder keys = realistic ~/.ssh layout, no secret, stable snapshot

FAKE_BIN_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMAND_NAME="$(basename "$0")"

main() {
	if [[ "$COMMAND_NAME" == git && "${1:-}" != clone ]]; then
		PATH="$(path_without "$FAKE_BIN_DIR" "$PATH")"  ## already exported
		exec git "$@"
	fi

	local call
	call="$(anonymize "$(format_call "$COMMAND_NAME" "$@")" "$HOME" "$USER")"
	echo "$call" >> "${SIMULATION__FAKE_COMMANDS_LOG:?should be set by simulate-provisioning.sh}"
	echo "  ↳ [fake] $call" >&2

	if [[ "$COMMAND_NAME" == ssh-keygen ]]; then
		write_placeholder_keys_if_generating "$@"
	fi
}

path_without() {
	local dir_to_remove="$1"
	local path="$2"

	printf '%s' "$path" | tr ':' '\n' | grep -vxF "$dir_to_remove" | paste -sd: -
}

format_call() {
	local command_name="$1"
	shift

	if [ $# -eq 0 ]; then
		echo "$command_name"
		return
	fi
	echo "$command_name$(printf ' %q' "$@")"
}

## the log is committed: keep it portable across machines/usernames
anonymize() {
	local text="$1"
	local home="$2"
	local user="$3"

	## placeholders via variables: a literal ~ in the replacement is tilde-expanded by bash 4.3+
	local home_placeholder='~'
	# shellcheck disable=SC2016  ## literal $USER is the intended placeholder
	local user_placeholder='$USER'
	local text_without_home="${text//"$home"/$home_placeholder}"
	printf '%s\n' "${text_without_home//"$user"/$user_placeholder}"
}

## a key generation = both -t and -f, ex. `ssh-keygen -t ed25519 -C comment -f ~/.ssh/id_ed25519`
write_placeholder_keys_if_generating() {
	local key_type=""
	local key_path=""
	while [ $# -gt 0 ]; do
		case "$1" in
			-t)           key_type="${2:-}"; shift ;;
			-f)           key_path="${2:-}"; shift ;;
			-a|-b|-C|-N)  shift ;;  ## other options taking a value
		esac
		shift
	done

	if [[ -z "$key_type" || -z "$key_path" ]]; then
		return 0
	fi

	## must NOT look like a real key, or secret scanners will flag the snapshot
	echo "FAKE $key_type private key, written by simulate-provisioning.sh" > "$key_path"
	echo "FAKE $key_type public key, written by simulate-provisioning.sh" > "$key_path.pub"
}

main "$@"
