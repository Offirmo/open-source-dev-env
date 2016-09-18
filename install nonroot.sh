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


############ Ubuntu settings ############
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set com.canonical.Unity always-show-menus true


############ Structure ############
mkdir ~/work
mkdir ~/work/bin
mkdir ~/work/bin/shellrc
mkdir ~/work/install
mkdir ~/work/tmp
mkdir ~/work/src
mkdir ~/work/docs


############ Node ############
## NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash -s stable


############ Ruby ############
## RVM https://rvm.io/
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable


############ Misc ############

## polices powerline
## https://github.com/powerline/fonts
cd ~/work/install
git clone --recursive https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ~


#umake ide webstorm
