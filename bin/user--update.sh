#! /bin/bash

############ updates ############
echo ""
echo "************ Updating your system… ************"


############ Global package managers ############
## brew (macOS)
if command -v brew > /dev/null; then
	echo ""
	echo "******* \`brew\` detected, updating… *******"

	echo "  * \`brew upgrade\`…"
	brew upgrade

	echo "  * \`brew update\`…"
	brew update

	echo "  * \`brew cleanup\`…"
	brew cleanup

	echo "  * \`brew doctor\`…"
	brew doctor
fi


## apt (Ubuntu)
## TODO
#alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- https://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash'



############ Dev Env -- node ############
## nvm
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
echo "DETECTED_NVM_DIR = $DETECTED_NVM_DIR"
echo "DETECTED_NVM_DIR- = ${DETECTED_NVM_DIR:-}"
if [[ -n $DETECTED_NVM_DIR ]]; then
	## https://github.com/nvm-sh/nvm
	echo ""
	echo "******* nvm detected, updating… *******"
	## 1) update nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
	## 2) (re)load it
	. "${DETECTED_NVM_DIR:-}/nvm.sh"
	## 3) install latest lts
	nvm install 'lts/*'
fi
#avn setup



############ Dev Env -- Python ############
## pip
if command -v pip > /dev/null; then
	echo ""
	echo "******* pip detected, updating… *******"
	pip install --upgrade pip
fi



############ Dev Env -- ruby ############
#rvm get stable



############ Dev Env -- Java ############



############ Dev Env -- Rust ############



############ Dev Env -- Go ############
