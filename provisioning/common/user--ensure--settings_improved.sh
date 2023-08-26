#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* revision = circa 2023"
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


###### profiles #######

## bash
if [ ! -f ~/.bash_profile ]; then
	echo "echo \"* hello from: .bash_profile\"" > ~/.bash_profile
	echo "" >> ~/.bash_profile
	echo "if [ -f ~/.profile ]; then . ~/.profile; fi" >> ~/.bash_profile
	echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> ~/.bash_profile
	echo "" >> ~/.bash_profile
fi
if [ ! -f ~/.bashrc ]; then
	echo "echo \"* hello from: .bashrc\"" > ~/.bashrc
	echo "" >> ~/.bashrc
fi
if [ ! -f ~/.bash_logout ]; then
	echo "echo \"* hello from: .bash_logout\"" > ~/.bash_logout
	echo "" >> ~/.bash_logout
fi


if [ ! -f ~/.profile ]; then
	echo "echo \"* hello from: .profile\"" > ~/.profile
	echo "" >> ~/.profile
fi
echo "source ~/work/src/off/open-source-dev-env/bin/load_shellrc.sh" >> ~/.profile

if [ ! -f ~/.zlogin ]; then
	echo "echo \"* hello from: .zlogin\"" > ~/.zlogin
	echo "" >> ~/.zlogin
fi
if [ ! -f ~/.zshrc ]; then
	echo "echo \"* hello from: .zshrc\"" > ~/.zshrc
	echo "" >> ~/.zshrc
fi


############ Git ############
git config --global push.default simple
git config --global color.ui "auto"
## global gitignore
## https://gist.github.com/subfuzion/db7f57fff2fb6998a16c
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore
## from https://github.com/dandavison/delta/blob/master/README.md
git config --global core.pager "delta --syntax-theme='Solarized (light)'"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.merge "conflictstyle = diff3"
git config --global delta.side-by-side true
git config --global diff.colorMoved "default"
## from https://stackoverflow.com/questions/18308535/automatic-prune-with-git-fetch-or-pull/40842589#40842589
# Enable automatic pruning for all your repos
git config --global fetch.prune true
git config --global fetch.pruneTags true
# Enable if you use a git GUI
git config --global gui.pruneDuringFetch true



############ npm ############
npm config set init-author-email offirmo.net@gmail.com
npm config set init-author-name Offirmo
npm config set init-author-url https://www.offirmo.net
npm config set init-license Unlicense
npm config set init-version 0.0.1


############ yarn ############
## https://yarnpkg.com/en/docs/cli/config
# TODO check if inherited from npm ? maybe not if config in alternate place
yarn config set color always
yarn config set init-license Unlicense
yarn config set init-version 0.0.1


echo "* all done."
