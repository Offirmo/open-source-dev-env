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

echo "* all done."
