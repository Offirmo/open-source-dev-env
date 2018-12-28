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


############ Repos ############
## MUST use git@github.com: to allow ssh auth
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/clean-code-toolbox.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/cli-toolbox.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/hello-world-browser-extension.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/hello-world-npm.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/hello-world-npx.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/prefixed-log.git
#~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/unit-test-toolbox.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/bangja.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/cross-js-env-tests.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/Etendard.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/internationalize.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/minisite-w.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/node-typescript-compiler.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/offirmo.github.io.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/online-adventur.es.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/random-js.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/simplyconfig.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/tbrpg-model.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/tbrpg-static-data.git
#~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/web-module-toolbox.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo-team/wiki.wiki.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/blog.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/minisite-bookmarks-ghpages.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/offirmo-monorepo.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/offirmo.github.io.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/sync-local-repos.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/web-tech-experiments.git
~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/x.git

~/work/src/off/open-source-dev-env/bin/gitc.sh  git@github.com:online-adventures/online-adventures.github.io.git
