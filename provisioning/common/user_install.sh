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

############ Node ############
## NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash -s stable
source ~/.nvm/nvm.sh
nvm install 6


############ Offirmo shared scripts ############
mkdir -p ~/work/src/off
pushd ~/work/src/off > /dev/null
if [[ ! -d open-source-dev-env ]]; then
    git clone --recursive git@github.com:Offirmo/open-source-dev-env.git
    echo "source ~/work/src/open-source-dev-env/shellrc/bashrc.sh" >> ~/.bashrc
fi
popd > /dev/null


############ misc ############

## solarized color scheme
## http://ethanschoonover.com/solarized
pushd ~/work/install > /dev/null
SOLARIZED_INSTALL_DIR=solarized
if [[ ! -d ~/work/install/$SOLARIZED_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/altercation/solarized.git $SOLARIZED_INSTALL_DIR
else
    cd $SOLARIZED_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null

## jetbrains solarized color scheme
## https://github.com/jkaving/intellij-colors-solarized
pushd ~/work/install > /dev/null
JETBRAINS_SOLARIZED_INSTALL_DIR=intellij-colors-solarized
if [[ ! -d ~/work/install/$JETBRAINS_SOLARIZED_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/jkaving/intellij-colors-solarized.git $JETBRAINS_SOLARIZED_INSTALL_DIR
else
    cd $JETBRAINS_SOLARIZED_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null

## FiraCode font
## https://github.com/tonsky/FiraCode
pushd ~/work/install > /dev/null
FIRACODE_INSTALL_DIR=FiraCode
if [[ ! -d ~/work/install/$FIRACODE_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/tonsky/FiraCode.git $FIRACODE_INSTALL_DIR
else
    cd $FIRACODE_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null


## Offline doc TODO
## devdocs
#git clone https://github.com/Thibaut/devdocs.git && cd devdocs
## reactive extensions
## CSS
## https://blogs.msdn.microsoft.com/typescript/2016/12/07/announcing-typescript-2-1/
