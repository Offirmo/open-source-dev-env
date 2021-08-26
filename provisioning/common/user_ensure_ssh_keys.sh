#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* start ENV"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"

## generate if missing
mkdir -p ~/.ssh

## 100 rounds: https://crypto.stackexchange.com/a/40902
if [ ! -f ~/.ssh/id_ed25519.pub ]; then
	ssh-keygen -a 100 -t ed25519 -C "$USER"
fi
if [ ! -f ~/.ssh/id_ed25519_offirmo.pub ]; then
	ssh-keygen -a 100 -t ed25519 -C "offirmo.net@gmail.com" -f ~/.ssh/id_ed25519_offirmo
fi
#if [ ! -f ~/.ssh/id_rsa.pub ]; then
#	ssh-keygen -t rsa -b 4096 -C "offirmo.net@gmail.com" -f ~/.ssh/id_rsa_foo
#fi

## ensure correct permissions
## https://gist.github.com/grenade/6318301
chmod 700 ~/.ssh
## strict default (for private keys)
chmod 600 ~/.ssh/*
## less strict for non-private
chmod 644 ~/.ssh/*.pub
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/known_hosts
[ -f ~/.ssh/authorized_keys ] && chmod 644 ~/.ssh/authorized_keys
