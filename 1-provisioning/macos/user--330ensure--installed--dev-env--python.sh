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


## https://docs.brew.sh/Homebrew-and-Python


## https://pypi.org/project/pipx/
#brew install pipx
#pipx ensurepath
echo "* PLEASE REVIEW THIS FILE! ⚠️⚠️⚠️"




#pyenv: not recommended (2022/12)
#brew install pyenv
#pyenv install 3.9.6
#pyenv global 3.9.6



#############################################################
echo "* …all done ✅"
