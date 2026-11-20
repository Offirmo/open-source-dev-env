#@IgnoreInspection BashAddShebang
## REM : this file is meant to conveniently complement ~/.bashrc / ~/.zshrc
##       It is supposed to be called in login and non-login shells, after the main rc
##       Usage: source this file (NOT executable: uses bash/zsh syntax, and executing it would be pointless anyway)
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S)   ↳ […ode/…/load_shellrc.sh] hello!" >&2


## source all .sh files immediate children of the given dir, in alphabetical order
source_files_from_dir() {
	## not gated by VERBOSE__RC: a misconfiguration should always be visible
	## return 0: a shell rc should not fail
	if [[ ! -d "$1" ]]; then
		echo "⚠️ […ode/…/load_shellrc.sh] expected a directory, not found: ${1}" >&2
		return 0
	fi

	_rc_log "    ├ sourcing files from ${1}…"

	## zsh errors on an unmatched glob (NOMATCH) when bash leaves it literal (filtered by -f below)
	## NOT "setopt local_options": it would also revert the options set by the sourced files
	local should_restore_nomatch=false
	[ -n "$ZSH_VERSION" ] && [[ -o nomatch ]] && should_restore_nomatch=true
	$should_restore_nomatch && unsetopt nomatch
	## globs are sorted alphabetically (no need for ls|sort = forks)
	local files
	files=( "$1"/*.sh )
	$should_restore_nomatch && setopt nomatch

	local file
	for file in "${files[@]}"; do
		[[ -f "$file" ]] && source "$file"
	done
	_rc_log "  ↲ done sourcing files from ${1}"
}

## also used by the sourced files
## no-op unless troubleshooting: each fork costs several ms (more with an EDR)
## stderr to not pollute the stdout of scripts/tools
_rc_log() {
	[[ "$VERBOSE__RC" == true ]] || return 0

	if [ -n "$ZSH_VERSION" ]; then
		## prompt-expansion of the format only = no fork
		local timestamp_format='%D{%H:%M:%S}'
		echo "${(%)timestamp_format} $*" >&2
	## elif BASH = fallthroug
	## bash 3.2 (macOS) has no builtin date formatting
	else
		echo "$(date +%H:%M:%S) $*" >&2
	fi
}

## keeps the 1st occurrence = same semantics as zsh's `typeset -U` (in ~/.zshenv), so bash only
## why: installers (Docker Desktop, brew…) keep re-adding non-idempotent PATH lines to the profiles,
##      and nested login shells re-run them
## pure parameter expansion: no fork, no glob expansion of the entries (unlike `for dir in $PATH`)
_dedupe_PATH() {
	local remaining="$PATH:" deduped="" dir
	while [ -n "$remaining" ]; do
		dir="${remaining%%:*}"
		remaining="${remaining#*:}"
		## empty entry = implicit current dir = unsafe
		[ -z "$dir" ] && continue
		case ":$deduped:" in
			*":$dir:"*) ;;
			*) deduped="${deduped:+$deduped:}$dir" ;;
		esac
	done
	export PATH="$deduped"
}

source_files_from_dir "$HOME/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/shellrc"
source_files_from_dir "$HOME/work/bin/shellrc"
## last: after every file that may add to the PATH
## (if, not &&: a false test would make this file return 1 in zsh = error status at the 1st prompt)
if [ -n "$BASH_VERSION" ]; then _dedupe_PATH; fi
