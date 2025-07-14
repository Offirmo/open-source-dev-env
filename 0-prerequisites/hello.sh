#! /bin/bash
## DEMO of Shell provision script FOR TEST PURPOSE


echo "#########################"
echo "# provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2024"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH            = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL   = $BASH_SUBSHELL"
echo "  - whoami          = `whoami`"
echo "  - pwd             = `pwd`"
echo "  - LANG            = `echo $LANG`"
echo "  - LC_ALL          = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting ▶️"

echo "*** hello, `whoami` ! ***"
echo "This a demo script doing nothing!"
echo "- USER                      = `echo $USER`"
echo "- COMPANY                   = `echo $COMPANY`"
echo "- COMPANY_DOMAIN            = `echo $COMPANY_DOMAIN`"
echo "- PERSONAL_USERNAME__GITHUB = `echo PERSONAL_USERNAME__GITHUB`"

#############################################################
echo "* …all done ✅"
