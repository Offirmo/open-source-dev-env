echo "* hello from: offirmo_aliases.sh"

alias x='exit'

## works if installed via umake
alias ws='jetbrains-webstorm &'

## git
alias s='git status'
alias b='git branch'
alias ga='echo "Current git account :"; echo "   `git config --get user.name` (`git config --get user.email`)"'
alias gfp='git fetch && git pull'
alias ur='CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout master; git pull; git checkout $CURRENT_BRANCH; git fetch origin master; git rebase origin/master'
alias gac='git add . && git commit -m "+" --no-verify'
alias gitc='gitc.sh'

## node
alias kng='killall node grunt gulp tsc phantomjs'
alias un='npm prune && npm upgrade && npm outdated'
alias ut='./node_modules/.bin/typings i'
alias unt='npm prune && npm upgrade && ./node_modules/.bin/typings i'
alias onn='npm i -g outdated diff-so-fancy git-recent git-standup typescript@next typings gulp'

## projects
alias wte='cd ~/work/src/web-tech-experiments; git_offirmo.sh; nvm install'
alias oa='cd ~/work/src/oa; git_offirmo.sh; nvm use'
alias ba='cd ~/work/src/bangja; git_offirmo.sh; nvm use'
alias pre='cd ~/work/src/prefixed-log; git_offirmo.sh; nvm use'
alias cro='cd ~/work/src/cross-js-env-tests; git_offirmo.sh; nvm install 6'
alias hwe='cd ~/work/src/hello-world-npm; git_offirmo.sh; nvm use'
alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use'
alias tbd='cd ~/work/src/tb-static-data; git_offirmo.sh; nvm use'
alias clt='cd ~/work/src/cli-toolbox; git_offirmo.sh; nvm use'
alias utt='cd ~/work/src/unit-test-toolbox; git_offirmo.sh; nvm use'
alias ntc='cd ~/work/src/node-typescript-compiler; git_offirmo.sh; nvm use'
alias orn='cd ~/work/src/random-js; git_offirmo.sh; nvm use'
alias slr='cd ~/work/src/sync-local-repos; git_offirmo.sh; nvm use 6'
alias vde='cd ~/work/src/virtualized-open-source-dev-env; git_offirmo.sh'
alias oin='cd ~/work/src/internationalize; git_offirmo.sh; nvm use'

#alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use; export TIMEZONE_PLUS_ONE=true'
