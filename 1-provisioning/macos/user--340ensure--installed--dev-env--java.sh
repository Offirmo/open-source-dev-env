#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2026"
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

## OR TODO mise mise use -g java@temurin-21


## java env switcher
## https://www.jenv.be/
brew install jenv

# JDKs as casks — they register under /Library/Java/JavaVirtualMachines
## most used as of 2026
brew install --cask temurin@21
## LTS as of 2026
brew install --cask temurin@25
# add others as needed: temurin@17, temurin@26, etc.

eval "$(jenv init -)"
jenv add /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/temurin-25.jdk/Contents/Home
jenv global 21

jenv enable-plugin export
jenv enable-plugin maven
jenv enable-plugin gradle


# TODO evaluate a good java
# Amazon Corretto JDK: https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/macos-install.html
#brew tap adoptopenjdk/openjdk/adoptopenjdk8 # deprecated https://github.com/AdoptOpenJDK/homebrew-openjdk

## Install mvnvm. DO NOT install normal maven
#brew install mvnvm

## java env switcher
# TODO evaluate https://www.jenv.be/
#brew install jenv
#jenv doctor


#############################################################
echo "* all done."
