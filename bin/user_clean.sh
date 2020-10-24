#! /bin/bash

############ cleanups ############

rm -rf ~/.npm-pkgr/
rm -rf ~/.npm_lazy
rm -rf ~/.npm
yarn cache clean
npm cache clean --force

nvm ls
