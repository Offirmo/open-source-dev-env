#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2023"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* start ENV"
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
## Java
# disabled 2022/12
exit 1

# TODO evaluate a good java
# Amazon Corretto JDK: https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/macos-install.html

#brew install --cask temurin

## install v8
#brew tap adoptopenjdk/openjdk/adoptopenjdk8 # deprecated https://github.com/AdoptOpenJDK/homebrew-openjdk
#brew install --cask temurin8

## install latest version
#brew install java

## Install mvnvm. DO NOT install normal maven
#brew install mvnvm

## java env switcher
#brew install jenv
#jenv doctor


#############################################################
echo "* all done."
