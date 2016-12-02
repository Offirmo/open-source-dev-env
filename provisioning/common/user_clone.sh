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
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/bangja.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/clean-code-toolbox.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/cli-toolbox.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/cross-js-env-tests.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/Etendard.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/hello-world-npm.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/internationalize.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/minisite-w.git             m-w
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/node-typescript-compiler.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/offirmo.github.io.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/online-adventur.es.git     oa
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/prefixed-log.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/random-js.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/simplyconfig.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/sync-local-repos.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/tbrpg-model.git            tb-model
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/tbrpg-static-data.git      tb-static-data
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/unit-test-toolbox.git
~/work/src/open-source-dev-env/bin/gitc.sh  git@github.com:Offirmo/web-tech-experiments.git
~/work/src/open-source-dev-env/bin/gitc.sh  https://github.com/Offirmo-team/wiki.wiki.git
