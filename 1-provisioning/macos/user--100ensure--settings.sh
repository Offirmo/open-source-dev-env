#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2024"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting…"


############ macOS settings ############

## https://apple.stackexchange.com/questions/340542/show-hidden-files-on-mac-os-x-mojave-using-terminal/340543#340543
## https://www.defaults-write.com/display-the-file-extensions-in-finder/
## Or use shortcut: (in finder) Cmd ⌘ + Shift ⇧ + .  (full stop, period)
defaults write com.apple.finder AppleShowAllFiles -boolean true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## https://www.defaults-write.com/display-full-posix-path-in-os-x-finder-title-bar/
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## https://www.defaults-write.com/disable-window-animations-in-finder/
defaults write com.apple.finder DisableAllAnimations -bool true

## macOs disable shell warning
## https://support.apple.com/en-us/HT208050
TARGET_FILE=~/.bash_profile
LINE="export BASH_SILENCE_DEPRECATION_WARNING=1"
if ! grep -q "${LINE}" "${TARGET_FILE}"; then
	echo "Silencing Bash deprecation warning... ($TARGET_FILE)"
	echo "$LINE" >> $TARGET_FILE
fi

#############################################################
echo "* …all done ✅"
