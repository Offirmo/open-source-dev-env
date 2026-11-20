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
############################################################
echo "* starting…"


############ macOS settings ############

## https://www.defaults-write.com/show-hidden-files-in-os-x-finder/
## Or use shortcut: (in finder) Cmd ⌘ + Shift ⇧ + .  (full stop, period)
defaults write com.apple.Finder AppleShowAllFiles -bool true

## https://www.defaults-write.com/display-the-file-extensions-in-finder/
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## https://www.defaults-write.com/display-full-posix-path-in-os-x-finder-title-bar/
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## https://www.defaults-write.com/disable-window-animations-in-finder/
defaults write com.apple.finder DisableAllAnimations -bool true


## TODO 1D https://www.defaults-write.com/

#############################################################
echo "* …all done ✅"
