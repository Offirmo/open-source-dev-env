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


############ Ruby ############
## RVM https://rvm.io/
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm


############ Java ############
## https://confluence.jetbrains.com/display/IDEADEV/JetBrains+Runtime+Environment
## https://bintray.com/jetbrains/intellij-jdk/openjdk8-linux-x64
JDK_ID=jbsdk8u112b340_linux_x64
if [[ ! -d ~/work/install/${JDK_ID} ]]; then
    curl -L "https://dl.bintray.com/jetbrains/intellij-jdk/${JDK_ID}.tar.gz" -o ~/work/install/${JDK_ID}.tar.gz
    pushd ~/work/install > /dev/null
    mkdir ${JDK_ID}
    tar -xzf ${JDK_ID}.tar.gz -C ${JDK_ID}
    popd > /dev/null
fi


############ Fonts ############
## https://github.com/powerline/fonts
pushd ~/work/install > /dev/null
POWERLINE_INSTALL_DIR=powerline_fonts
if [[ ! -d ~/work/install/$POWERLINE_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/powerline/fonts.git $POWERLINE_INSTALL_DIR
    cd $POWERLINE_INSTALL_DIR
    ./install.sh
fi
popd > /dev/null


############ Offirmo shared scripts ############
pushd ~/work/src > /dev/null
if [[ ! -d open-source-dev-env ]]; then
    git clone --recursive git@github.com:Offirmo/open-source-dev-env.git
    echo "source ~/work/src/open-source-dev-env/shellrc/bashrc.sh" >> ~/.bashrc
fi
popd > /dev/null


############ TOSORT ############
#umake ide webstorm
