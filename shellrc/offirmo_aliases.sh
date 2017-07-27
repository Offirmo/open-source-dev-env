#@IgnoreInspection BashAddShebang
echo "* hello from: offirmo_aliases.sh"

## standard Ubuntu "some more ls aliases"
## but we may not be on Ubuntu
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## mine ;)
alias x='exit'
alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash'

## works if installed via umake
alias ws='jetbrains-webstorm &'

## git
alias s='git status'
alias b='git branch'
alias ga='echo "Current git account :"; echo "   `git config --get user.name` (`git config --get user.email`)"'
alias gfp='git fetch && git pull'
alias ur='CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout master; git pull; git checkout $CURRENT_BRANCH; git fetch origin master; git rebase origin/master'
alias gac='git add . && git commit -m "TLDW :scream_cat:" --no-verify'
alias gitc='gitc.sh'

## JS
alias tpx='rm -rf .awcache bower_components node_modules typings'

## node
alias kng='killall node grunt gulp yarn tsc phantomjs'
alias un='npm install && npm outdated'
alias uy='yarn && yarn outdated'
alias ut='./node_modules/.bin/typings i'
alias unt='npm prune && npm upgrade && ./node_modules/.bin/typings i'
## note: no yarn upgrade since it's not the same as npm upgrade
alias uyt='yarn && ./node_modules/.bin/typings i'
alias onn='npm i -g diff-so-fancy git-recent git-standup gulp yarn updtr lerna'
alias npm-reset='npm cache clean; '

## projects
alias ba='cd ~/work/src/bangja; git_offirmo.sh; nvm use'
alias blog='cd ~/work/src/blog; git_offirmo.sh; rvm use ruby-2.1'
alias cct='cd ~/work/src/clean-code-toolbox; git_offirmo.sh; nvm install'
alias clt='cd ~/work/src/cli-toolbox; git_offirmo.sh; nvm install'
alias cro='cd ~/work/src/cross-js-env-tests; git_offirmo.sh; nvm install 6'
alias dac='cd ~/work/src/distributed-accountancy; git_offirmo.sh; nvm install'
alias hre='cd ~/work/src/coding-exercises-hr; git_offirmo.sh; nvm use'
alias hwe='cd ~/work/src/hello-world-npm; git_offirmo.sh; nvm use'
alias hwra='cd ~/work/src/hello-world-react-app; git_offirmo.sh; nvm use'
alias hwrat='cd ~/work/src/hello-world-react-app-typescript; git_offirmo.sh; nvm use'
alias mbo='cd ~/work/src/minisite-bookmarks-ghpages; git_offirmo.sh; nvm use'
alias mw='cd ~/work/src/minisite-wedding-ghpages; git_offirmo.sh; nvm use'
alias ntc='cd ~/work/src/node-typescript-compiler; git_offirmo.sh; nvm use'
alias oa='cd ~/work/src/online-adventures; git_offirmo.sh; nvm use'
alias ode='cd ~/work/src/open-source-dev-env; git_offirmo.sh'
alias ogi='cd ~/work/src/offirmo.github.io; git_offirmo.sh; nvm use'
alias oin='cd ~/work/src/internationalize; git_offirmo.sh; nvm use'
alias omr0='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use'
alias omr1='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/definitions'
alias omr2='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/data'
alias omr3='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-weapons'
alias omr4='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-armors'
alias omr5='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-adventures'
alias omr6='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-prng'
alias omr7='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-wallet'
alias omr8='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-inventory'
alias omr9='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-character'
alias omr10='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/view-text'
alias omr11='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-the-boring-rpg'
alias omrA='cd ~/work/src/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/the-npm-rpg'
alias orn='cd ~/work/src/random-js; git_offirmo.sh; nvm use'
alias pre='cd ~/work/src/prefixed-log; git_offirmo.sh; nvm use'
alias rxa='cd ~/work/src/rx-auto; git_offirmo.sh; nvm install'
alias slr='cd ~/work/src/sync-local-repos; git_offirmo.sh; nvm use 6'
alias tbd='cd ~/work/src/tb-static-data; git_offirmo.sh; nvm use'
alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use'
alias utt='cd ~/work/src/unit-test-toolbox; git_offirmo.sh; nvm use'
alias wmt='cd ~/work/src/web-module-toolbox; git_offirmo.sh; nvm install'
alias wte='cd ~/work/src/web-tech-experiments; git_offirmo.sh; nvm install'

#alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use; export TIMEZONE_PLUS_ONE=true'
