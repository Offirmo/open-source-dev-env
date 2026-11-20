#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026/07"
echo "#########################"

if [ "$EUID" -eq 0 ]; then
	echo "* should NOT be run as root ❌"
	exit 1
fi

## predictable output of tools (english messages, code-point sorting = same on macOS and Linux)
## C.UTF-8 = the only UTF-8 locale available on both (en_US.UTF-8 may not be generated on Linux)
export LANG=C.UTF-8 LC_ALL=C.UTF-8

echo "* environment diagnostic:"
echo "  - bash = $BASH $BASH_VERSION, SHLVL = $SHLVL, stdin = $([ -t 0 ] && echo tty || echo 'not a tty (piped?)')"
echo "  - user = $(whoami), HOME = $HOME"
echo "  - OS   = $(uname -sm) ($([[ "$OSTYPE" == darwin* ]] && echo "macOS $(sw_vers -productVersion)" || ( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )))"
echo "  - XDG_CONFIG_HOME = ${XDG_CONFIG_HOME:-(unset)}, XDG_CACHE_HOME = ${XDG_CACHE_HOME:-(unset)}"
echo "  - XDG_DATA_HOME   = ${XDG_DATA_HOME:-(unset)}, XDG_STATE_HOME = ${XDG_STATE_HOME:-(unset)}"
############################################################
## XDG base dirs = the spec defaults when unset or empty
## https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
## NOT exported: no change for child processes (some tools behave differently when set, ex. nvm's installer)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

############################################################
echo "* starting ▶️"


############ XDG base dirs ############
## expected by some tools (e.g. "virtualenv")
## https://askubuntu.com/a/14536
## 700 = the spec's mode for creating them (no-op on existing dirs)
## (-m only applies to the deepest dir = intended, ex. ~/.local itself is not a base dir)
mkdir -p -m 700 "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"
## fixed location per the spec, no XDG variable
mkdir -p "$HOME/.local/bin"
## .ssh has its own script
echo "* user dir structure ✅"


############ Personal data structure ############
mkdir -p ~/work
mkdir -p ~/work/bin
mkdir -p ~/work/bin/shellrc
## (00-init.sh is owned by user--010ensure--settings--shell.sh)
if [ ! -f ~/work/bin/shellrc/aliases.sh ]; then
	{
		echo '#@IgnoreInspection BashAddShebang'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/aliases.sh] hello!" >&2'
		echo
		echo 'alias foo='\''cd ~/work/src/bar/'\'''
	} >> ~/work/bin/shellrc/aliases.sh
fi

mkdir -p ~/work/docs
mkdir -p ~/work/install
mkdir -p ~/work/src
mkdir -p ~/work/tmp

echo "* ~/work structure ✅"

#############################################################
echo "* …all done ✅"
