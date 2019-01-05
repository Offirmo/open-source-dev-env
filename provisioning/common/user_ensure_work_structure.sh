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


############ Structure ############
mkdir -p ~/work
mkdir -p ~/work/bin
mkdir -p ~/work/bin/shellrc
echo "#! /bin/bash" > ~/work/bin/shellrc/keep.sh
mkdir -p ~/work/containers
mkdir -p ~/work/docs
mkdir -p ~/work/install
mkdir -p ~/work/src
mkdir -p ~/work/tmp

###### profiles #######

if [ ! -f ~/.profile ]; then
	echo "echo \"* hello from: .profile\"" > ~/.profile
fi
if [ ! -f ~/.bashrc ]; then
	echo "echo \"* hello from: .bashrc\"" > ~/.bashrc
	## https://docs.reactioncommerce.com/docs/requirements
	echo "ulimit -n 65536 65536" >> ~/.bashrc
fi
if [ ! -f ~/.bash_profile ]; then
	echo "echo \"* hello from: .bash_profile\"" > ~/.bash_profile
	echo "" >> ~/.bash_profile
	echo "if [ -f ~/.profile ]; then . ~/.profile; fi" >> ~/.bash_profile
	echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> ~/.bash_profile
fi
if [ ! -f ~/.bash_logout ]; then
	echo "echo \"* hello from: .bash_logout\"" > ~/.bash_logout
fi
