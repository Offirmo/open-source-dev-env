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
## http://www.macworld.co.uk/how-to/mac-software/how-show-hidden-files-in-mac-os-x-finder-funter-macos-sierra-3520878/
## TODO check
#defaults write com.apple.finder AppleShowAllFiles YES

## http://apple.stackexchange.com/a/99214/214344
## TODO check
#defaults write -g AppleShowAllFiles -bool true

## Use shortcut: (in finder) Cmd ⌘ + Shift ⇧ + .  (full stop, period)
## https://apple.stackexchange.com/a/340543


############ Global settings ############
## global gitignore
echo ".DS_Store" >> ~/.gitignore
