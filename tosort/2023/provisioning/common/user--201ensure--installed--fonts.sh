#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2023"
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

TODO REVIEW

## FiraCode font
## https://github.com/tonsky/FiraCode
## (disabled, trying brew cask font)
#pushd ~/work/install > /dev/null
#FIRACODE_INSTALL_DIR=FiraCode
#if [[ ! -d ~/work/install/$FIRACODE_INSTALL_DIR ]]; then
#    git clone --recursive https://github.com/tonsky/FiraCode.git $FIRACODE_INSTALL_DIR
#else
#    cd $FIRACODE_INSTALL_DIR
#    git fetch
#    git pull
#fi
#popd > /dev/null

## Fira sans
## https://en.wikipedia.org/wiki/Fira_(typeface)
#pushd ~/work/install > /dev/null
#FIRASANS_INSTALL_DIR=FiraSans
#if [[ ! -d ~/work/install/$FIRASANS_INSTALL_DIR ]]; then
#    git clone --recursive https://github.com/bBoxType/FiraSans.git $FIRASANS_INSTALL_DIR
#else
#    cd $FIRASANS_INSTALL_DIR
#    git fetch
#    git pull
#fi
#popd > /dev/null


## Comic Neue font
## https://comicneue.com/
#pushd ~/work/install > /dev/null
#COMICNEUE_INSTALL_DIR=ComicNeue
#if [[ ! -d ~/work/install/COMICNEUE_INSTALL_DIR ]]; then
#    git clone --recursive https://github.com/crozynski/comicneue.git COMICNEUE_INSTALL_DIR
#else
#    cd COMICNEUE_INSTALL_DIR
#    git fetch
#    git pull
#fi
#popd > /dev/null



## fonts
echo "******* installing some fonts through brew…"
### Allow fonts  https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts
brew update
## https://github.com/be5invis/Iosevka
brew install --cask font-iosevka
brew install --cask font-comic-neue
brew install --cask font-fira-code
brew install --cask font-fira-sans
brew install --cask font-fira-sans-condensed
brew install --cask font-fira-sans-extra-condensed

#############################################################
echo "* …all done ✅"
