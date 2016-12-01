#! /bin/bash

## Shell provision script

echo "#####################"
echo "# root provisioning #"
echo "#####################"

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

## prepare possible alternative locales
sudo locale-gen fr_FR
sudo locale-gen fr_FR.UTF-8

## allow remote access
sudo apt install -y  openssh-server

## ensure our machine has correct time
sudo apt install -y  ntp

## A useful resource monitoring tool.
## Just run it to test it.
sudo apt install -y  dstat

## A useful resource monitoring tool. (better than 'top')
## Just run it to test it.
sudo apt install -y  htop

## useful for misc operations
sudo apt install -y  zip

## standard, posix-compliant safe shell
sudo apt install -y  bash

## basic tools
sudo apt install -y  jq curl vim nano

## for extensions
sudo apt install -y  linux-headers-$(uname -r)
sudo apt install -y dkms
