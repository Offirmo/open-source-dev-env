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

####### require bash #######

####### profiles ########

## common
## POSIX = /etc/profile -> ~/.profile
if [ ! -f ~/.profile ]; then
	echo "echo \"* hello from: .profile\""                               >  ~/.profile
	echo ""                                                              >> ~/.profile
	echo "source ~/work/src/off/open-source-dev-env/bin/load_shellrc.sh" >> ~/.profile
fi

## bash
## ref = https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
## interactive login    : /etc/profile -> ~/.bash_profile or ~/.bash_login or ~/.profile
## interactive non login: ~/.bashrc
if [ ! -f ~/.bash_profile ]; then
	echo "if [ -f ~/.profile ]; then . ~/.profile; fi" >> ~/.bash_profile
	echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> ~/.bash_profile
	echo "echo \"* hello from: .bash_profile\""               >  ~/.bash_profile
	echo ""                                                   >> ~/.bash_profile
	echo ""                                                   >> ~/.bash_profile
fi
if [ ! -f ~/.bashrc ]; then
	echo "echo \"* hello from: .bashrc\"" >  ~/.bashrc
	echo ""                               >> ~/.bashrc
else
	## 2023/08 seen already present on a fresh macos
	echo ".bashrc already present, not changing it -> Please check it's ok!"
fi
if [ ! -f ~/.bash_logout ]; then
	echo "echo \"* hello from: .bash_logout\"" >  ~/.bash_logout
	echo ""                                    >> ~/.bash_logout
fi


## zsh
## ref = https://zsh.sourceforge.io/Guide/zshguide02.html
## /etc/zshenv -> ~/.zshenv ~/.zshrc
if [ ! -f ~/.zshenv ]; then
	echo "echo \"* hello from: .zshenv\"" >  ~/.zshenv
	echo ""                               >> ~/.zshenv
fi
if [ ! -f ~/.zlogin ]; then
	echo "echo \"* hello from: .zlogin\"" >  ~/.zlogin
	echo ""                               >> ~/.zlogin
fi
if [ ! -f ~/.zprofile ]; then
	echo "echo \"* hello from: .zprofile\""            >  ~/.zprofile
	echo ""                                            >> ~/.zprofile
	echo "if [ -f ~/.profile ]; then . ~/.profile; fi" >> ~/.zprofile
	echo ""                                            >> ~/.zprofile
fi
if [ ! -f ~/.zshrc ]; then
	echo "echo \"* hello from: .zshrc\""                 >  ~/.zshrc
	echo ""                                              >> ~/.zshrc
	echo "if [ -f ~/.zprofile ]; then . ~/.zprofile; fi" >> ~/.zshrc
	echo ""                                              >> ~/.zshrc
fi

echo "* PLEASE RESTART YOUR TERMINAL! ⚠️⚠️⚠️"
#############################################################
echo "* …all done ✅"
