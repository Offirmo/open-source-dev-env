#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026/07"
echo "#########################"

if [ "$EUID" -eq 0 ]; then
	echo "* should NOT be run as root ❌"
	exit 1
fi

## predictable output of tools (english messages, code-point sorting = same on macOS and Linux)
## C.UTF-8 = the only UTF-8 locale available on both (en_US.UTF-8 may not be generated on Linux)
export LANG=C.UTF-8 LC_ALL=C.UTF-8

echo "* environment diagnostic:"
echo "  - bash = $BASH $BASH_VERSION, SHLVL = $SHLVL, stdin = $([ -t 0 ] && echo tty || echo 'not a tty (piped?)')"
echo "  - user = $(whoami), HOME = $HOME"
echo "  - OS   = $(uname -sm) ($([[ "$OSTYPE" == darwin* ]] && echo "macOS $(sw_vers -productVersion)" || ( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )))"
echo "  - brew = $(command -v brew || echo '(not found)')"
echo "  - mise = $(command -v mise || echo '(not found)')"
############################################################
echo "* starting…"


############ Node ############
## Mise https://mise.jdx.dev/getting-started.html
## TODO review mise recommends own installer
echo "* (re)installing mise…"
if command -v brew > /dev/null; then
	## brew (macOs)
	## last reviewed: 2026/05
	brew install mise
elif command -v apt > /dev/null; then
	## apt (Ubuntu)
	## last reviewed: 2026/05
	sudo install --directory --mode=755 /etc/apt/keyrings
	curl --fail --show-error --silent https://mise.en.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.asc 1> /dev/null
	echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.en.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
	sudo apt update --yes
	sudo apt install --yes mise
fi
mise use --global node@lts
mise use --global npm:iterm2-tab-set
## XXX breaks if non-standard npm registry https://github.com/nodejs/corepack/issues/296
## also not really needed if mise
#mise use --global npm:corepack
#export COREPACK_NPM_REGISTRY="https://registry.npmjs.org"
#corepack enable

## NVM (LEGACY, FYI)
## https://github.com/nvm-sh/nvm#installing-and-updating
#echo "* (re)installing nvm…"
# PROFILE=/dev/null  BC we load nvm ourselves in a more clever way, so don't want the install to touch .bashrc
#PROFILE=/dev/null bash -c 'curl --output - https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'
#source ~/.nvm/nvm.sh
#nvm install 'lts/*'
#nvm alias default 'lts/*'
#echo "* nvm installed ✅"

## TODO review
#npm install --global  yarn @ast-grep/cli && corepack enable
echo "* basic global pkgs installed ✅"


############ npm ############
## TODO review only if Offirmo?
npm config set init-author-email  offirmo.net@gmail.com
npm config set init-author-name   Offirmo
npm config set init-author-url    https://www.offirmo.net
npm config set init-license       Unlicense
npm config set init-version       0.0.1
echo "* npm config set ✅"


############ yarn ############
## https://yarnpkg.com/en/docs/cli/config
# TODO check if inherited from npm ? maybe not if config in alternate place
if command -v yarn &> /dev/null; then
	yarn config set color         always
	yarn config set init-license  Unlicense
	yarn config set init-version  0.0.1
	echo "* yarn config set ✅"
fi


#############################################################
echo "* …all done ✅"
