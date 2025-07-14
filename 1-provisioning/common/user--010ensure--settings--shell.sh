#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2024"
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
## https://docs.google.com/spreadsheets/d/1VC5DRHw-ResS5LgoTA131ORXCv9s_aNGuhUNOEeA1-c/edit?gid=495591543#gid=495591543

## common
## POSIX = /etc/profile -> ~/.profile
if [ -f ~/.profile ]; then
	echo "* ~/.profile already exists ✅"
else
	echo "* creating a runtime config file: ~/.profile ▶️"
	{
		echo '## user-wide profile for sh(1)'
		echo '## may also be sourced by bash(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.profile] hello!"'
		echo ''
		echo '#export PERSONAL_USERNAME__GITHUB=Foo'
		echo ''
		echo '#export COMPANY="foo"'
		echo '#export COMPANY_DOMAIN="$COMPANY.com"'
		echo ''
	} >> ~/.profile
fi


## bash
## interactive login    : /etc/profile -> ~/.bash_profile OR ~/.bash_login OR ~/.profile
## interactive non login: ~/.bashrc
if [ -f ~/.bash_profile ]; then
	echo "* ~/.bash_profile already exists ✅"
else
	echo "* creating a runtime config file: ~/.bash_profile ▶️"
	{
		echo '## user-wide profile for bash(1)'
		echo '## this config file is usually the first user-level file to be sourced for bash (after /etc/bashrc)'
		echo '## https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html'
		echo ''
		echo '## for troubleshooting, uncomment as wished:'
		echo '#if [ -n "$PS1" ]; then export VERBOSE__RC=true; fi'
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.bash_profile] hello!"'
		echo '[ -n "$PS1" ]              && echo "  * shell is interactive"'
		echo 'shopt -q login_shell       && echo "  * shell is a login shell"  # https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch'
		echo ''
		echo 'export BASH_SILENCE_DEPRECATION_WARNING=1'
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo ''
		echo 'if shopt -q login_shell && [ -f ~/.bash_login ]; then . ~/.bash_login; fi ## call it if login shell since it may be unintentionally shadowed by this file'
		echo 'if [ -f ~/.profile ]; then . ~/.profile; fi'
		echo 'if [ -f ~/.bashrc  ]; then . ~/.bashrc;  fi ## very common practice, most tools expect this file to be always sourced'
		echo ''
	} >> ~/.bash_profile
fi
if [ -f ~/.bashrc ]; then
	echo "* ~/.bashrc already exists ✅"
else
	echo "* creating a runtime config file: ~/.bashrc ▶️"
	{
		echo '## user-wide runtime configuration for bash(1)'
		echo '## in theory it’s non-login only but in practice everyone expect it to be always sourced'
		echo '## https://apple.stackexchange.com/a/13019/214344'
		echo ''
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.bashrc] hello!"'
		echo ''
	} >> ~/.bashrc
fi


## zsh
## /etc/zshenv -> ~/.zshenv ~/.zshrc
if [ -f ~/.zshenv ]; then
	echo "* ~/.zshenv already exists ✅"
else
	echo "* creating a runtime config file: ~/.zshenv ▶️"
	{
		echo '## user-wide configuration for zsh(1)'
		echo '## this config file should be the first user-level file to be sourced for zsh (after /etc/zshenv and /etc/zprofile)'
		echo '## https://zsh.sourceforge.io/Guide/zshguide02.html'
		echo ''
		echo '## for troubleshooting, uncomment as wished:'
		echo 'if [ -n "$PS1" ]; then export VERBOSE__RC=true; fi  ## uncomment this to troubleshoot'
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.zshenv] hello!"'
		echo ''
	} >> ~/.zshenv
fi
if [ -f ~/.zprofile ]; then
	echo "* ~/.zprofile already exists ✅"
else
	echo "* creating a runtime config file: ~/.zprofile ▶️"
	{
		echo '## user-wide profile for zsh(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.zprofile] hello!"'
		echo ''
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo 'if [ -f ~/.profile ]; then . ~/.profile; fi'
		echo ''
	} >> ~/.zprofile
fi
if [ -f ~/.zshrc ]; then
	echo "* ~/.zshrc already exists ✅"
else
	echo "* creating a runtime config file: ~/.zshrc ▶️"
	{
		echo '## user-wide runtime configuration for zsh(1)'
		echo '[ "$VERBOSE__RC" == true ] && echo "* [~/.zshrc] hello!"'
		echo ''
	} >> ~/.zshrc
fi

if [[ -n "$COMPANY" ]]; then
	TARGET=$HOME/work/bin/git--$COMPANY.sh
	if [ -f $TARGET ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		{
			echo '#! /bin/bash'
			echo "git config user.email     \"$USER@$COMPANY_DOMAIN\""
			echo "git config user.name      \"$USER\""
			echo ''
			echo "npm set init-author-email \"$USER@$COMPANY_DOMAIN\""
			echo "npm set init-author-name  \"$USER\""
			echo ''
		} >> $TARGET
	fi

	TARGET=$HOME/work/bin/shellrc/alias--$COMPANY.sh
	if [ -f $TARGET ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		{
			echo '#! /bin/bash'
			echo ''
		} >> $TARGET
	fi
else
	echo "* reminder to set \$COMPANY"
fi;

echo "* PLEASE RESTART YOUR TERMINAL! ⚠️⚠️⚠️"
#############################################################
echo "* …all done ✅"
