#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* start ENV"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
echo "  - PATH          = $PATH"
## full env
#env


############ macOS settings ############
## https://apple.stackexchange.com/questions/340542/show-hidden-files-on-mac-os-x-mojave-using-terminal/340543#340543
defaults write com.apple.finder AppleShowAllFiles -boolean true
## Or use shortcut: (in finder) Cmd ⌘ + Shift ⇧ + .  (full stop, period)


############ Global settings ############
## global gitignore
echo ".DS_Store" >> ~/.gitignore
