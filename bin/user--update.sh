#! /bin/bash

############ updates ############

## brew
brew upgrade
brew update
brew cleanup
brew doctor

## Python
pip install --upgrade pip

## JS
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 'lts/*'
#onn
#avn setup

## ruby
#rvm get stable
