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

############ Repos ############
## MUST use git@github.com: to allow ssh auth

## Offirmo
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/open-source-dev-env.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/minisite-bookmarks-ghpages.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/offirmo-monorepo.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/web-tech-experiments.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/offirmo.github.io.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/my.dev.to.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/sync-local-repos.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/blog.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/x.git

## Offirmo team
## https://github.com/Offirmo-team
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo-team/wiki.git

## Offirmo's Online Adventures
## https://github.com/online-adventures
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/online-adventures/online-adventures.github.io.git

#############################################################
echo "* …all done ✅"
