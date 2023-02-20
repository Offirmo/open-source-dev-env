#! /bin/bash

## Shell provision script

echo "#####################"
echo "# root provisioning #"
echo "#####################"

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

################################

mkdir -p /work
mkdir -p /work/bin
mkdir -p /work/install

## seen missing on fresh MacOs Ventura
## absence prevents yarn global from working :-(
## https://stackoverflow.com/a/25654791/587407
sudo mkdir -p -m 775 /usr/local/bin

echo "* all done."
