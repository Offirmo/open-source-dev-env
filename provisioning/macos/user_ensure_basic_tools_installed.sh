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
echo "* revision = circa 2021"
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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

brew cask install sizeup keepassx xnviewmp

brew cask install visual-studio-code

brew install git-cola git-delta

brew cask install iterm2

brew cask adobe-acrobat-reader

brew cask steam

## disabled: virtualbox dropbox

## fonts
brew tap homebrew/cask-fonts
## https://github.com/be5invis/Iosevka
brew cask install font-iosevka
brew cask install font-fira-code

## https://iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash

## quick look plugins
## https://github.com/sindresorhus/quick-look-plugins
## TODO check if they are working / worth it
#brew cask install qlcolorcode qlstephen webpquicklook
#brew uninstall qlcolorcode qlstephen webpquicklook


## ruby
## https://rvm.io/rvm/install
\curl -sSL https://get.rvm.io | bash -s stable --ruby

## python
brew cask install pyenv
pyenv install 3.9.6
pyenv global 3.9.6

echo "* all done."
