#@IgnoreInspection BashAddShebang
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S)     ↳ […ode/…/_01paths.sh] hello!" >&2

## Important reads
## - https://disconnect3d.pl//2026/10/02/dont-put-tilde-in-your-path/   <- ok because we target bash/zsh



#####################
## INIT
#echo "initial PATH= $PATH"

## (helpers defined first since used right below and in sibling files)
## no-op if already present = idempotent when re-sourced / in nested shells
_prepend_to_PATH_if_not_present() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*) export PATH="$1:$PATH" ;;
	esac
}
_append_to_PATH_if_not_present() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*) export PATH="$PATH:$1" ;;
	esac
}

## zsh: auto-dedupe PATH (keeps 1st occurrence)
## -g is mandatory: this file is sourced from within a function, the param would be local otherwise
## both PATH and path are needed: -U on path alone doesn't dedupe "PATH=..." assignments (used by brew, mise…)
[ -n "$ZSH_VERSION" ] && typeset -gU PATH path

## ODE stuff is very specific, order shouldn't matter
_prepend_to_PATH_if_not_present "${HOME}/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin"

#####################
## specific bins
## -> see _sub_tools.sh

#####################
## generic bins
## This is important bc some tools install there and expect to be picked up

## references
## https://linux.slashdot.org/story/23/12/24/221229/a-proposed-change-for-fedora-40-unify-usrbin-with-usrsbin
## https://news.ycombinator.com/item?id=31336396
## https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local

## original Operating system
## (we may want to override them)
_prepend_to_PATH_if_not_present "/bin"
_prepend_to_PATH_if_not_present "/sbin"

## packages independent of the OS but ~standardized,
## ex. Macports https://guide.macports.org/#installing.shell
_prepend_to_PATH_if_not_present "/opt/local/bin"
_prepend_to_PATH_if_not_present "/opt/local/sbin"

## self, in-house maintained software
_prepend_to_PATH_if_not_present "/usr/bin"
_prepend_to_PATH_if_not_present "/usr/sbin"
_prepend_to_PATH_if_not_present "/usr/local/bin"
_prepend_to_PATH_if_not_present "/usr/local/sbin"

## Seen in some installer (ex. CodeRabbit CLI, Lume...)
_prepend_to_PATH_if_not_present "${HOME}/.local/bin"

## ODE stuff
_prepend_to_PATH_if_not_present "${HOME}/work/bin"


## debug
#echo "final PATH= $PATH"
