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

## good reads
# https://www.baeldung.com/linux/rc-files#rc-configuration-files


####### require bash #######

####### profiles ########

## common
## POSIX = /etc/profile -> ~/.profile
if [ ! -f ~/.profile ]; then
	echo "* creating a runtime config file: ~/.profile"
	{
		echo '## user-wide profile for sh(1)'
		echo '## may also be sourced by bash(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.profile"'
		echo ''
		echo 'source ~/work/src/off/open-source-dev-env/bin/load_shellrc.sh'
		echo ''
	} >> ~/.profile
fi


## bash
## ref = https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
## interactive login    : /etc/profile -> ~/.bash_profile OR ~/.bash_login OR ~/.profile
## interactive non login: ~/.bashrc
if [ ! -f ~/.bash_profile ]; then
	echo "* creating a runtime config file: ~/.bash_profile"
	{
		echo '## user-wide profile for bash(1)'
		## this config file should be the first user-level file to be sourced for bash
		echo '#if [ -n "$PS1" ]; then export VERBOSE__RC=true fi  ## uncomment this to troubleshoot'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.bash_profile"'
		echo ''
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo ''
		echo 'if shopt -q login_shell && [ -f ~/.bash_login ]; then . ~/.bash_login; fi ## call it if login shell as it may be shadowed by this file'
		echo 'if [ -f ~/.profile ]; then . ~/.profile; fi'
		echo 'if [ -f ~/.bashrc  ]; then . ~/.bashrc;  fi'
		echo ''
	} >> ~/.bash_profile
fi
## https://apple.stackexchange.com/a/13019/214344
if [ ! -f ~/.bashrc ]; then
	echo "* creating a runtime config file: ~/.bashrc"
	{
		echo '## user-wide runtime configuration for bash(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.bashrc"'
		echo ''
	} >> ~/.bashrc
fi


## zsh
## ref = https://zsh.sourceforge.io/Guide/zshguide02.html
## /etc/zshenv -> ~/.zshenv ~/.zshrc
if [ ! -f ~/.zshenv ]; then
	echo "* creating a runtime config file: ~/.zshenv"
	{
		echo '## user-wide configuration for zsh(1)'
		## this config file should be the first user-level file to be sourced for zsh
		echo '#if [ -n "$PS1" ]; then export VERBOSE__RC=true fi  ## uncomment this to troubleshoot'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.zshenv"'
		echo ''
	} >> ~/.zshenv
fi
if [ ! -f ~/.zprofile ]; then
	echo "* creating a runtime config file: ~/.zprofile"
	{
		echo '## user-wide profile for zsh(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.zprofile"'
		echo ''
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo 'if [ -f ~/.profile ]; then . ~/.profile; fi'
		echo ''
	} >> ~/.zprofile
fi
if [ ! -f ~/.zshrc ]; then
	echo "* creating a runtime config file: ~/.zshrc"
	{
		echo '## user-wide runtime configuration for zsh(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* hello from: ~/.zshrc"'
		echo ''
	} >> ~/.zshrc
fi

echo "* PLEASE RESTART YOUR TERMINAL! ⚠️⚠️⚠️"
#############################################################
echo "* …all done ✅"
