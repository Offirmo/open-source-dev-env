#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* revision = circa 2022"
echo "* start ENV"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
echo "  - PATH          = $PATH"
## full env
#env


############ Repos ############
## MUST use git@github.com: to allow ssh auth

## Offirmo
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/open-source-dev-env.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/minisite-bookmarks-ghpages.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo/offirmo-monorepo--2022.git      offirmo-monorepo
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


echo "* all done."
