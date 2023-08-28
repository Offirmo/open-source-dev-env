#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# [BASH_SOURCE] = $BASH_SOURCE"
echo "#########################"

## safety
## https://serverfault.com/a/500778
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* revision = circa 2023"
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
#############################################################
exit 1

## python
## TODO REVIEW disabled 2023/08

#echo "******* python through pipx/virtualenv…"
## Note: current Netlify requires 3.9.6

## https://pypi.org/project/pipx/
#brew install pipx
#pipx ensurepath
## virtualenv via pipx  https://virtualenv.pypa.io/en/latest/installation.html
#pipx install virtualenv

#pyenv: not recommended (2022/12)
#brew install pyenv
#pyenv install 3.9.6
#pyenv global 3.9.6

#############################################################
echo "* all done."
