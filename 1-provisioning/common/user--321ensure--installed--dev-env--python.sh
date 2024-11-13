#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2024"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
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
echo "* starting…"

## concepts:
## - python vs python3
## - pip
## - pipx
## - venv (integrated) https://docs.python.org/3/library/venv.html
## - virtualenv https://virtualenv.pypa.io/en/latest/user_guide.html
## - pyenv https://github.com/pyenv/pyenv
## - pyenv-virtualenv https://github.com/pyenv/pyenv-virtualenv
## "seed packages" = pip, setuptools, wheel




## virtualenv via pipx  https://virtualenv.pypa.io/en/latest/installation.html
## assuming pipx was installed via an os-dedependent method
#pipx install virtualenv


## https://pip.pypa.io/en/stable/installation/
## only inside a virtualenv?
#python3 -m ensurepip --upgrade





#############################################################
echo "* …all done ✅"
