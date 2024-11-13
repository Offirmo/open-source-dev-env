#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2023"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting ▶️"

## generate if missing
mkdir -p ~/.ssh

if [ ! -f ~/.ssh/config ]; then
	echo "" >> ~/.ssh/config
#TODO config
#ControlMaster auto
#ControlPath ~/.ssh/socket-%r@%h:%p
#
#ServerAliveInterval 300
#
## Hosts
#Host *
#AddKeysToAgent yes
#UseKeychain yes
fi
if [ ! -f ~/.ssh/known_hosts ]; then
	echo "" >> ~/.ssh/known_hosts
fi
if [ ! -f ~/.ssh/authorized_keys ]; then
	echo "" >> ~/.ssh/authorized_keys
fi

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
	## 100 rounds: https://crypto.stackexchange.com/a/40902
	ssh-keygen -a 100 -t ed25519 -C "$USER" -f ~/.ssh/id_ed25519
	sleep 1
	echo "please add your new key to GitHub & BB:"
	open https://github.com/settings/keys
	open https://bitbucket.org/account/settings/ssh-keys/
	echo "cat ~/.ssh/id_ed25519.pub | pbcopy"
fi

if [ ! -f ~/.ssh/id_ed25519_offirmo.pub ]; then
	ssh-keygen -a 100 -t ed25519 -C "offirmo.net@gmail.com" -f ~/.ssh/id_ed25519_offirmo
	sleep 1

	echo "please add your new key to GitHub & BB:"
	open https://github.com/settings/keys
	open https://bitbucket.org/account/settings/ssh-keys/
	echo "cat ~/.ssh/id_ed25519_offirmo.pub | pbcopy"

	echo ""                                          >> ~/.ssh/config
	echo "Host offirmo.github.com"                   >> ~/.ssh/config
	echo "   HostName github.com"                    >> ~/.ssh/config
	echo "   User git"                               >> ~/.ssh/config
	echo "   IdentityFile ~/.ssh/id_ed25519_offirmo" >> ~/.ssh/config
	echo "   IdentitiesOnly yes"                     >> ~/.ssh/config
	echo ""                                          >> ~/.ssh/config
fi


## ensure correct permissions
## https://gist.github.com/grenade/6318301
chmod 700 ~/.ssh
## strict default (for private keys)
chmod 600 ~/.ssh/*
## less strict for non-private
chmod 644 ~/.ssh/*.pub
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/authorized_keys

############################################################
echo "* …all done ✅"
