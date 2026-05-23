#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2026"
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
echo "* starting…"


############ Node ############
## Mise https://mise.jdx.dev/getting-started.html
echo "* (re)installing mise…"
if command -v brew > /dev/null; then
	## brew (macOs)
	## last reviewed: 2026/05
	brew install mise
elif command -v apt > /dev/null; then
	## apt (Ubuntu)
	## last reviewed: 2026/05
	sudo install -dm 755 /etc/apt/keyrings
	curl -fSs https://mise.en.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.asc 1> /dev/null
	echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.en.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
	sudo apt update -y
	sudo apt install -y mise
fi
mise use -g node@24
mise use -g npm:corepack@0

## NVM (LEGACY, FYI)
## https://github.com/nvm-sh/nvm#installing-and-updating
#echo "* (re)installing nvm…"
# PROFILE=/dev/null  BC we load nvm ourselves in a more clever way, so don't want the install to touch .bashrc
#PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'
#source ~/.nvm/nvm.sh
#nvm install 'lts/*'
#nvm alias default 'lts/*'
#echo "* nvm installed ✅"



npm install --global corepack iterm2-tab-set yarn @ast-grep/cli && corepack enable
echo "* basic global pkgs installed ✅"


############ npm ############
npm config set init-author-email  offirmo.net@gmail.com
npm config set init-author-name   Offirmo
npm config set init-author-url    https://www.offirmo.net
npm config set init-license       Unlicense
npm config set init-version       0.0.1
echo "* npm config set ✅"


############ yarn ############
## https://yarnpkg.com/en/docs/cli/config
# TODO check if inherited from npm ? maybe not if config in alternate place
# TODO how do we have yarn installed? TODO install it!!!
yarn config set color         always
yarn config set init-license  Unlicense
yarn config set init-version  0.0.1
echo "* yarn config set ✅"



#############################################################
echo "* …all done ✅"
