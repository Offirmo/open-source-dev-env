#! /bin/bash

## Shell provision script

echo "#####################"
echo "# root provisioning #"
echo "#####################"

## safety
## https://serverfault.com/a/500778
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

## Java
#sudo apt-get install -y  oracle-java8-installer
#sudo apt-get install -y  oracle-java8-set-default

## man pages
sudo apt install -y  man-db

## obviously
sudo apt install -y  git

## a tool to install more tools !
sudo apt install -y  ubuntu-make

## to share files
sudo apt install -y  samba

## gcc
sudo apt install -y  build-essential

## for node (dixit nvm)
sudo apt install -y  libssl-dev

## chrome
## https://www.google.fr/chrome/browser
#sudo apt install -y  libappindicator1 libindicator7 libxss1 fonts-liberation libcurl3 xdg-utils
#cd
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb
