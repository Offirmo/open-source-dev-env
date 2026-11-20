#! /bin/bash

## Shell provision script

echo "#####################"
echo "# root provisioning #"
echo "#####################"

## predictable output of tools (english messages, code-point sorting)
## C.UTF-8 = always available, unlike en_US.UTF-8 which is only generated further below
export LANG=C.UTF-8 LC_ALL=C.UTF-8

## debug informations
echo "* start ENV"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = $LANG"
echo "  - LC_ALL        = $LC_ALL"
echo "  - PATH          = $PATH"
## full env
#env

################################

## locales: minimal/container images only ship C.UTF-8 (+ C, POSIX)
## `locales` provides locale-gen, needed by everything below
sudo apt install --yes  locales
## exported by our ~/.profile (cf. user--010ensure--settings--shell.sh)
sudo locale-gen en_US.UTF-8

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

echo "* all done."
