#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## safety
## http://serverfault.com/a/500778
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

################################

## Brew
## https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C
brew cask install visual-studio-code
brew install git-cola
brew cask install iterm
brew cask dropbox adobe-acrobat-reader station virtualbox visual-studio-code
