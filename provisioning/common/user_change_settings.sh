#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* start ENV"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
echo "  - PATH          = $PATH"
## full env
#env


############ Git ############
git config --global push.default simple
git config --global color.ui "auto"

npm config set init-license UNLICENSED
npm config set init-version 0.0.1
# TODO
#globalconfig = "/home/x/.nvm/versions/node/v6.8.1/etc/npmrc"
#globalignorefile = "/home/x/.nvm/versions/node/v6.8.1/etc/npmignore"
#init-author-email = ""
#init-author-name = ""
#init-author-url = ""
#init-module = "/home/x/.npm-init.js"
#userconfig = "/home/x/.npmrc"

## https://yarnpkg.com/en/docs/cli/config
# TODO check if inherited from npm ? maybe not if config in alternate place
yarn config set init-license UNLICENSED
yarn config set init-version 0.0.1
