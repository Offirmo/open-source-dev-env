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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 'lts/*'
#onn
#avn setup

## ruby
#rvm get stable
