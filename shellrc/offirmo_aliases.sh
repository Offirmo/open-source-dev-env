#@IgnoreInspection BashAddShebang
echo "* hello from: offirmo_aliases.sh"

## standard Ubuntu "some more ls aliases"
## but we may not be on Ubuntu
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## mine ;)
alias x='exit'
alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/superuser_cleanup.sh | sudo bash'

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

## JS
alias tpx='rm .awcache -rf bower…components node_modules typings'

## node
alias kng='killall node grunt gulp tsc phantomjs'
alias un='npm prune && npm upgrade && npm outdated'
alias uy='yarn && yarn upgrade && yarn outdated'
alias ut='./node_modules/.bin/typings i'
alias unt='npm prune && npm upgrade && ./node_modules/.bin/typings i'
## note: no yarn upgrade since it's not the same as npm upgrade
alias uyt='yarn && ./node_modules/.bin/typings i'
alias onn='npm i -g outdated diff-so-fancy git-recent git-standup typescript@next typings gulp yarn'
alias npm-reset='npm cache clean; '

## projects
alias ba='cd ~/work/src/bangja; git_offirmo.sh; nvm use'
alias cct='cd ~/work/src/clean-code-toolbox; git_offirmo.sh; nvm install'
alias clt='cd ~/work/src/cli-toolbox; git_offirmo.sh; nvm use'
alias cro='cd ~/work/src/cross-js-env-tests; git_offirmo.sh; nvm install 6'
alias hwe='cd ~/work/src/hello-world-npm; git_offirmo.sh; nvm use'
alias hwra='cd ~/work/src/hello-world-react-app; git_offirmo.sh; nvm use'
alias hwrat='cd ~/work/src/hello-world-react-app-typescript; git_offirmo.sh; nvm use'
alias mbo='cd ~/work/src/minisite-bookmarks; git_offirmo.sh; nvm use'
alias mw='cd ~/work/src/m-w; git_offirmo.sh; nvm use'
alias ntc='cd ~/work/src/node-typescript-compiler; git_offirmo.sh; nvm use'
alias oa='cd ~/work/src/oa; git_offirmo.sh; nvm use'
alias ode='cd ~/work/src/open-source-dev-env; git_offirmo.sh'
alias ogi='cd ~/work/src/offirmo.github.io; git_offirmo.sh; nvm use'
alias oin='cd ~/work/src/i18n; git_offirmo.sh; nvm use'
alias orn='cd ~/work/src/random-js; git_offirmo.sh; nvm use'
alias pre='cd ~/work/src/prefixed-log; git_offirmo.sh; nvm use'
alias slr='cd ~/work/src/sync-local-repos; git_offirmo.sh; nvm use 6'
alias tbd='cd ~/work/src/tb-static-data; git_offirmo.sh; nvm use'
alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use'
alias utt='cd ~/work/src/unit-test-toolbox; git_offirmo.sh; nvm use'
alias wmt='cd ~/work/src/web-module-toolbox; git_offirmo.sh; nvm install'
alias wte='cd ~/work/src/web-tech-experiments; git_offirmo.sh; nvm install'

#alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use; export TIMEZONE_PLUS_ONE=true'
