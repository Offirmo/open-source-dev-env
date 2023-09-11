#! /bin/bash

############ updates ############
echo ""
echo "************ Updating your system… ************"


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

## pip (Python)
if command -v pip > /dev/null; then
	echo ""
	echo "******* pip detected, updating… *******"
	pip install --upgrade pip
fi


## JS
## 1) update nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
## 2) (re)load it
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
## 3) install latest lts
nvm install 'lts/*'
#onn
#avn setup

## ruby
#rvm get stable

#alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- https://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash'
