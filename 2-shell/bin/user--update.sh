#! /bin/bash

############ updates ############
echo ""
echo "* hello from: …open-source-dev-env/…/user--update.sh"
echo "************ Updating your system… ************"



############ OS ############
## last reviewed: 2023/09
if command -v softwareupdate > /dev/null; then
	echo ""
	echo "******* macOS updates… *******"
	softwareupdate  --install  --safari-only  ## those don't require a restart
	softwareupdate  --list
fi


############ Global package managers ############

## brew (macOS)
## last reviewed: 2023/09
if command -v brew > /dev/null; then
	echo ""
	echo "******* \`brew\` detected, updating… *******"

	echo "  * \`brew upgrade\`…"
	brew upgrade
	echo "    * also consider running brew upgrade --greedy"

	echo "  * \`brew update\`…"
	brew update

	echo "  * \`brew cleanup\`…"
	brew cleanup

	echo "  * \`brew doctor\`…"
	brew doctor
fi

## apt (Ubuntu)
## last reviewed: TODO!!!
if command -v apt-get > /dev/null; then
	echo ""
	echo "******* Ubuntu's Advanced Packaging Tool detected, updating… *******"
	## https://blog.packagecloud.io/you-need-apt-get-update-and-apt-get-upgrade/
	sudo apt-get update
	sudo apt-get upgrade
	## XXX deprecated
	## also should go in "clean"
	#curl -o- https://www.offirmo.net/open-source-dev-env/1-provisioning/ubuntu/superuser_cleanup.sh | sudo bash
fi


############ Dev Env -- node ############
## nvm
## last reviewed: 2023/09
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#echo "DETECTED_NVM_DIR = $DETECTED_NVM_DIR"
#echo "DETECTED_NVM_DIR- = ${DETECTED_NVM_DIR:-}"
if [[ -n $DETECTED_NVM_DIR ]]; then
	## https://github.com/nvm-sh/nvm
	echo ""
	echo "******* \`nvm\` detected, updating… *******"
	## 1) update nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
	## 2) (re)load it
	. "${DETECTED_NVM_DIR:-}/nvm.sh"
	## 3) install latest lts
	set +e
	nvm install 'lts/*'
	NVM_RETURN=$?
	set -e
	echo "INSTALL RETURN $NVM_RETURN"
	## 3b) install critical packages with this lts
	npm install --global avn avn-nvm
	#avn setup
fi



############ Dev Env -- Python ############
## pip
if command -v pip > /dev/null; then
	echo ""
	echo "******* \`pip\` detected, updating… *******"
	pip install --upgrade pip
fi


############ Dev Env -- ruby ############
#rvm get stable



############ Dev Env -- Java ############



############ Dev Env -- Rust ############
if command -v rustup > /dev/null; then
	echo ""
	echo "******* Rust detected, updating… *******"
	rustup update
fi



############ Dev Env -- Go ############
