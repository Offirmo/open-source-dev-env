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
if [ -f ~/.ssh/known_hosts ]; then
	echo "* ~/.ssh/known_hosts already exists ✅"
else
	echo "* creating ~/.ssh/known_hosts ▶️"
	echo "" >> ~/.ssh/known_hosts
fi
if [ -f ~/.ssh/authorized_keys ]; then
	echo "* ~/.ssh/authorized_keys already exists ✅"
else
	echo "* creating ~/.ssh/authorized_keys ▶️"
	echo "" >> ~/.ssh/authorized_keys
fi

if [ -f ~/.ssh/id_ed25519.pub ]; then
	echo "* ~/.ssh/id_ed25519.pub already exists ✅"
else
	echo "* creating ~/.ssh/id_ed25519.pub ▶️"
	## 100 rounds: https://crypto.stackexchange.com/a/40902
	ssh-keygen -a 100 -t ed25519 -C "$USER" -f ~/.ssh/id_ed25519
	sleep 1
	echo "please add your new key ~/.ssh/id_ed25519.pub to GitHub & similar:"
	open https://github.com/settings/keys
	open https://bitbucket.org/account/settings/ssh-keys/
	echo "cat ~/.ssh/id_ed25519.pub | pbcopy"
fi

if [ -f ~/.ssh/id_ed25519_offirmo.pub ]; then
	echo "* ~/.ssh/id_ed25519_offirmo.pub already exists ✅"
else
	echo "* creating ~/.ssh/id_ed25519_offirmo.pub ▶️"
	ssh-keygen -a 100 -t ed25519 -C "offirmo.net@gmail.com" -f ~/.ssh/id_ed25519_offirmo
	sleep 1

	echo "please add your new key ~/.ssh/id_ed25519_offirmo to GitHub & similar:"
	open https://github.com/settings/keys
	open https://bitbucket.org/account/settings/ssh-keys/
	echo "cat ~/.ssh/id_ed25519_offirmo.pub | pbcopy"

	{
		echo ""
		echo "Host offirmo.github.com"
		echo "   HostName github.com"
		echo "   User git"
		echo "   IdentityFile ~/.ssh/id_ed25519_offirmo"
		echo "   IdentitiesOnly yes"
		echo ""
	} >> ~/.ssh/config
fi

if [[ -n "$PRIVATE_USERNAME" ]]; then
	TARGET=~/.ssh/id_ed25519_$PRIVATE_USERNAME
	if [ -f $TARGET.pub ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		ssh-keygen -a 100 -t ed25519 -C "$PRIVATE_USERNAME" -f $TARGET
		sleep 1

		echo "please add your new key $TARGET to GitHub & similar:"
		open https://github.com/settings/keys
		open https://bitbucket.org/account/settings/ssh-keys/
		echo "cat $TARGET.pub | pbcopy"

		{
			echo ""
			echo "Host $PRIVATE_USERNAME.github.com"
			echo "   HostName github.com"
			echo "   User git"
			echo "   IdentityFile $TARGET"
			echo "   IdentitiesOnly yes"
			echo ""
		} >> ~/.ssh/config
	fi
else
	echo "* reminder to set \$PRIVATE_USERNAME"
fi;



## ensure most restrictive permissions
## this is checked by some tools which will refuse to work if incorrect
## https://gist.github.com/grenade/6318301
chmod 700 ~/.ssh
## most restrictive permissions for private keys
## note: be careful to discriminate folders & files! (seen an employer creating a folder here)
chmod 600 `find ~/.ssh/* -type f`
chmod 700 `find ~/.ssh/* -type d`
# TODO review the 3 below
#chmod 644 ~/.ssh/config
#chmod 644 ~/.ssh/known_hosts
#chmod 644 ~/.ssh/authorized_keys
## slightly less strict for public
chmod 644 ~/.ssh/*.pub
echo "* ~/.ssh permissions ✅"

############################################################
echo "* …all done ✅"
