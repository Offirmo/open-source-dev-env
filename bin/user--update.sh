#! /bin/bash

############ updates ############

## brew
if command -v brew > /dev/null; then
	brew upgrade
	brew update
	brew cleanup
	brew doctor
fi

## pip (Python)
if command -v pip > /dev/null; then
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
