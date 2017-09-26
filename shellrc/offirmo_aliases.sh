#@IgnoreInspection BashAddShebang
echo "* hello from: …open-source-dev-env/shellrc/offirmo_aliases.sh"

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
alias onn='npm i -g diff-so-fancy yarn updtr lerna iterm2-tab-set avn avn-nvm'
# git-recent git-standup gulp
alias npm-reset='npm cache clean; '

## projects
alias off='cd ~/work/src/off; git_offirmo.sh; nvm use 8; tabset --badge 'off-X' --color "#F012BE"'
#alias ba='cd ~/work/src/off/bangja; git_offirmo.sh; nvm use'
#alias oa='cd ~/work/src/online-adventures; git_offirmo.sh; nvm use'
#alias tbd='cd ~/work/src/tb-static-data; git_offirmo.sh; nvm use'
#alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use'
alias blog='cd ~/work/src/off/blog; git_offirmo.sh; rvm use ruby-2.1'
alias blogx='cd ~/work/src/off/x; git_offirmo.sh'
alias cct='cd ~/work/src/off/clean-code-toolbox; git_offirmo.sh; nvm install'
alias clt='cd ~/work/src/off/cli-toolbox; git_offirmo.sh; nvm install'
alias cro='cd ~/work/src/off/cross-js-env-tests; git_offirmo.sh; nvm install 6'
alias dac='cd ~/work/src/off/distributed-accountancy; git_offirmo.sh; nvm install'
alias hre='cd ~/work/src/off/coding-exercises-hr; git_offirmo.sh; nvm use'
alias hwe='cd ~/work/src/off/hello-world-npm; git_offirmo.sh; nvm use'
alias hwgp='cd ~/work/src/off/hello-world-github-pages; git_offirmo.sh; nvm use 8'
alias hwgpj='cd ~/work/src/off/hello-world-react-app; git_offirmo.sh; nvm use'
alias hwra='cd ~/work/src/off/hello-world-react-app; git_offirmo.sh; nvm use'
alias hwrat='cd ~/work/src/off/hello-world-react-app-typescript; git_offirmo.sh; nvm use'
alias mbo='cd ~/work/src/off/minisite-bookmarks-ghpages; git_offirmo.sh; nvm use'
alias mw='cd ~/work/src/off/minisite-wedding-ghpages; git_offirmo.sh; nvm use'
alias ntc='cd ~/work/src/off/node-typescript-compiler; git_offirmo.sh; nvm use'
alias ode='cd ~/work/src/off/open-source-dev-env; git_offirmo.sh'
alias ogi='cd ~/work/src/off/offirmo.github.io; git_offirmo.sh; nvm use; ./.tabset offirmo.net'
alias oin='cd ~/work/src/off/internationalize; git_offirmo.sh; nvm use'
alias omr00='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; ./.tabset omr00'
alias omr01='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/definitions; ./.tabset omr01'
alias omr02='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/data; ./.tabset omr02'
alias omr11='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-armors; ./.tabset omr11'
alias omr12='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-weapons; ./.tabset omr12'
alias omr13='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-shop; ./.tabset omr13'
alias omr14='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-adventures; ./.tabset omr14'
alias omr15='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/logic-monsters; ./.tabset omr15'
alias omr21='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-prng; ./.tabset omr21'
alias omr22='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-wallet; ./.tabset omr22'
alias omr23='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-inventory; ./.tabset omr23'
alias omr24='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-character; ./.tabset omr24'
alias omr25='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-meta; ./.tabset omr25'
alias omr26='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/state-the-boring-rpg; ./.tabset omr26'
alias omr31='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/view-text; ./.tabset omr31'
alias omr32='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/view-chat; ./.tabset omr32'
alias omrA='cd ~/work/src/oa/oh-my-rpg; git_offirmo.sh; nvm use; cd packages/the-npm-rpg; ./.tabset omrA'
alias orn='cd ~/work/src/off/random-js; git_offirmo.sh; nvm use'
alias pre='cd ~/work/src/off/prefixed-log; git_offirmo.sh; nvm use'
alias rxa='cd ~/work/src/off/rx-auto; git_offirmo.sh; nvm install'
alias slr='cd ~/work/src/off/sync-local-repos; git_offirmo.sh; nvm use 6; ./.tabset slr'
alias utt='cd ~/work/src/off/unit-test-toolbox; git_offirmo.sh; nvm use'
alias wmt='cd ~/work/src/off/web-module-toolbox; git_offirmo.sh; nvm install'
alias wte='cd ~/work/src/off/web-tech-experiments; git_offirmo.sh; nvm install; ./.tabset wte'

#alias tbm='cd ~/work/src/tb-model; git_offirmo.sh; nvm use; export TIMEZONE_PLUS_ONE=true'

alias iw='cd ~/work/src/referral; git_atlassian.sh; nvm use'
