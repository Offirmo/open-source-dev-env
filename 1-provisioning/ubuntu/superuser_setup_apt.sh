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

## To handle 3rd party apt repositories
sudo apt install -y  software-properties-common python-software-properties

## allow secure apt repositories
sudo apt install -y  apt-transport-https

## add important apt repositories
#sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:bitcoin/bitcoin

## prepare further installations
sudo apt update
sudo apt upgrade --yes

echo "* all done."
