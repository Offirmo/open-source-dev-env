#! /bin/bash

## Shell provision script

echo "#####################"
echo "# root provisioning #"
echo "#####################"

## debug informations
echo "* start ENV"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
## full env
#env


## disable boot chime
## http://osxdaily.com/2012/11/04/disable-mac-boot-chime/
## TODO check if working / needed
#nvram SystemAudioVolume=%01
