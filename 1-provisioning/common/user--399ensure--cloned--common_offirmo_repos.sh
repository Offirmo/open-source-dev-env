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

## WARNING this assumes that ssh config was altered for offirmo / dual ssh key
## Offirmo
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/open-source-dev-env.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/minisite-bookmarks-ghpages.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/offirmo-monorepo.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/web-tech-experiments.git
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/offirmo.github.io.git
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/my.dev.to.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/sync-local-repos.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/blog.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/x.git

## Offirmo team
## git@offirmo.github.com:Offirmo-team
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo-team/wiki.git

## Offirmo's Online Adventures
## git@offirmo.github.com:online-adventures
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:online-adventures/online-adventures.github.io.git

#############################################################
echo "* …all done ✅"
