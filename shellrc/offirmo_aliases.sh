#@IgnoreInspection BashAddShebang
echo "* hello from: …open-source-dev-env/shellrc/offirmo_aliases.sh"

## standard Ubuntu "some more ls aliases"
## but we may not be on Ubuntu
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## mine ;)
alias x='exit'
#alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash'

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
alias p='puer --no-launch --port 1981'
#alias p='puer --no-launch --port 1981 --allow-cors'

## node
alias kng='killall node grunt gulp yarn tsc phantomjs flow webpack ngrok'
alias un='npm install && npm outdated'
alias uy='yarn && yarn outdated'
alias ut='./node_modules/.bin/typings i'
alias unt='npm prune && npm upgrade && ./node_modules/.bin/typings i'
alias onn='npm i -g mocha iterm2-tab-set avn avn-nvm yarn @atlassian/volt && yarn global add bolt'
# yarn diff-so-fancy

## projects
alias off='cd ~/work/src/off; git_offirmo.sh; tabset --badge 'off-X' --color "#F012BE"'
alias oa='cd ~/work/src/oa/online-adventures.github.io; git_offirmo.sh'
alias blog='cd ~/work/src/off/blog; git_offirmo.sh; rvm use ruby-2.1'
alias blogx='cd ~/work/src/off/x; git_offirmo.sh'
alias cct='cd ~/work/src/off/clean-code-toolbox; git_offirmo.sh'
alias clt='cd ~/work/src/off/cli-toolbox; git_offirmo.sh'
alias cro='cd ~/work/src/off/cross-js-env-tests; git_offirmo.sh'
alias hre='cd ~/work/src/off/coding-exercises-hr; git_offirmo.sh'
alias hwe='cd ~/work/src/off/hello-world-npm; git_offirmo.sh'
alias hwns='cd ~/work/src/off/hello-world-netlify-site; git_offirmo.sh'
alias hwnf='cd ~/work/src/off/hello-world-netlify-functions; git_offirmo.sh'
alias hwni='cd ~/work/src/off/hello-world-netlify-identity; git_offirmo.sh'
alias hwndb='cd ~/work/src/off/hello-world-netlify-db; git_offirmo.sh'
alias hwnp='cd ~/work/src/off/hello-world-netlify-pro; git_offirmo.sh'
alias hwgp='cd ~/work/src/off/hello-world-github-pages; git_offirmo.sh'
alias hwgpj='cd ~/work/src/off/hello-world-react-app; git_offirmo.sh'
alias hwra='cd ~/work/src/off/hello-world-react-app; git_offirmo.sh'
alias hwrat='cd ~/work/src/off/hello-world-react-app-typescript; git_offirmo.sh'
alias hwet='cd ~/work/src/off/hello-world-express-typescript; git_offirmo.sh'
alias hweta1='cd ~/work/src/off/hello-world-express-typescript-advanced-1; git_offirmo.sh'
alias mbo='cd ~/work/src/off/minisite-bookmarks-ghpages; git_offirmo.sh'
alias mw='cd ~/work/src/off/minisite-wedding-ghpages; git_offirmo.sh'
alias ntc='cd ~/work/src/off/node-typescript-compiler; git_offirmo.sh'
alias ode='cd ~/work/src/off/open-source-dev-env; git_offirmo.sh'
alias ogi='cd ~/work/src/off/offirmo.github.io; git_offirmo.sh; ./.tabset offirmo.net'


alias mono='cd ~/work/src/off/offirmo-monorepo; git_offirmo.sh; tabset --badge "mono" --color "#FF4136"'

alias mono01='cd ~/work/src/off/offirmo-monorepo/0-stdlib; git_offirmo.sh; cd normalize-string; ./.tabset mono01'
alias mono02='cd ~/work/src/off/offirmo-monorepo/0-stdlib; git_offirmo.sh; cd timestamps; ./.tabset mono02'
alias mono03='cd ~/work/src/off/offirmo-monorepo/0-stdlib; git_offirmo.sh; cd ts-types; ./.tabset mono03'
alias mono04='cd ~/work/src/off/offirmo-monorepo/0-stdlib; git_offirmo.sh; cd uuid; ./.tabset mono04'

alias sec='cd ~/work/src/off/offirmo-monorepo/1-foundation; git_offirmo.sh; cd soft-execution-context; ./.tabset SEC'
alias mono10='cd ~/work/src/off/offirmo-monorepo/1-foundation; git_offirmo.sh; cd print-error-to-ansi; ./.tabset mono10'
alias mono11='cd ~/work/src/off/offirmo-monorepo/1-foundation; git_offirmo.sh; cd practical-logger-core; ./.tabset mono11'
alias mono21='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd react-error-boundary; ./.tabset mono21'
alias mono22='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd rich-text-format; ./.tabset mono22'
alias mono23='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd rich-text-format-to-react; ./.tabset mono23'
alias mono25='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd view-chat; ./.tabset mono25'
alias mono26='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd view-chat-ui-tty; ./.tabset mono26'
alias mono30='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd view-css; ./.tabset mono30'
alias orn='cd ~/work/src/off/offirmo-monorepo/2-advanced; git_offirmo.sh; cd random; ./.tabset orn'

alias omr01='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd definitions; ./.tabset omr01'
alias omr11='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-armors; ./.tabset omr11'
alias omr12='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-weapons; ./.tabset omr12'
alias omr13='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-shop; ./.tabset omr13'
alias omr14='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-adventures; ./.tabset omr14'
alias omr15='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-monsters; ./.tabset omr15'
alias omr20='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-prng; ./.tabset omr20'
alias omr21='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-progress; ./.tabset omr21'
alias omr22='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-wallet; ./.tabset omr22'
alias omr23='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-character; ./.tabset omr23'
alias omr24='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-codes; ./.tabset omr24'
alias omr25='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-energy; ./.tabset omr25'
alias omr26='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-engagement; ./.tabset omr26'
alias omr27='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-inventory; ./.tabset omr27'
alias omr28='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-meta; ./.tabset omr28'
alias omr29='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-achievements; ./.tabset omr29'
alias omr40='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-the-boring-rpg; ./.tabset omr40'
alias omr50='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-rich-text; ./.tabset omr50'
alias omr51='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-browser; ./.tabset omr51'
alias omr52='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-browser-react; ./.tabset omr52'
alias omrA=' cd ~/work/src/off/offirmo-monorepo/apps; git_offirmo.sh; cd the-boring-rpg-node && ./.tabset omrA'
alias omrB=' cd ~/work/src/off/offirmo-monorepo/apps; git_offirmo.sh; cd the-boring-rpg-browser && ./.tabset omrB'
alias omrC=' cd ~/work/src/off/offirmo-monorepo/apps; git_offirmo.sh; cd clicker && ./.tabset omrC'

alias pre='cd ~/work/src/off/prefixed-log; git_offirmo.sh'
alias rxa='cd ~/work/src/off/rx-auto; git_offirmo.sh'
alias slr='cd ~/work/src/off/sync-local-repos; git_offirmo.sh; ./.tabset slr'
alias utt='cd ~/work/src/off/unit-test-toolbox; git_offirmo.sh'
alias wmt='cd ~/work/src/off/web-module-toolbox; git_offirmo.sh'
alias wte='cd ~/work/src/off/web-tech-experiments; git_offirmo.sh; ./.tabset wte'
alias put='cd ~/work/src/off/promise-utils; git_offirmo.sh; tabset --badge "p-u" --color "#FF4136"'
