#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## safety
## https://serverfault.com/a/500778
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* revision = circa 2022"
echo "* start ENV"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
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
## XXX need superuser
#echo "******* installing brew…"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
### Make brew support multiple versions
brew tap homebrew/cask-versions


echo "******* installing base apps through brew…"
## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

## no no no!!
#brew install git-lfs

brew install --cask sizeup keepassx xnviewmp kdiff3

brew install --cask visual-studio-code inkscape lepton

brew install git-cola git-delta rsync

brew install --cask iterm2 responsively insomnia

brew install --cask adobe-acrobat-reader

brew install --cask steam

## disabled: virtualbox dropbox

## fonts
echo "******* installing some fonts through brew…"
brew tap homebrew/cask-fonts
## https://github.com/be5invis/Iosevka
brew install --cask font-iosevka
brew install --cask font-fira-code

## https://iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash

## quick look plugins
## https://github.com/sindresorhus/quick-look-plugins
## TODO check if they are working / worth it
#brew install --cask qlcolorcode qlstephen webpquicklook
#brew uninstall qlcolorcode qlstephen webpquicklook


## ruby
## https://rvm.io/rvm/install
echo "******* installing ruby through rvm…"
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

## python
echo "******* python through pyenv…"
brew install pyenv
pyenv install 3.9.6
pyenv global 3.9.6

echo "* all done."

## Java
#brew install --cask temurin

## install v8
#brew tap adoptopenjdk/openjdk/adoptopenjdk8 # deprecated https://github.com/AdoptOpenJDK/homebrew-openjdk
brew tap homebrew/cask-versions
#brew install --cask temurin8

## install latest version
#brew install java

## Install mvnvm. DO NOT install normal maven
#brew install mvnvm
