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

## tools
## works if installed via umake
alias ws='jetbrains-webstorm &'
## need to be built
alias rdm='~/work/src/rdm/bin/osx/debug/rdm'

## git
alias s='git status'
alias b='git branch'
alias ga='echo "Current git account :"; echo "   `git config --get user.name` (`git config --get user.email`)"'
alias gfp='git fetch && git pull --recurse-submodules'
alias ur='CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout master; git pull; git checkout $CURRENT_BRANCH; git fetch origin master; git rebase origin/master'
alias gac='git add . && git commit -m "TLDW :scream_cat:" --no-verify'
alias gitc='gitc.sh'

## JS
alias tpx='rm -rf .awcache node_modules .npm npm-debug.log yarn-error.log yarn.lock .yalc bower_components typings'
#alias p='puer --no-launch --port 1981'
alias p='puer --no-launch --port 1981 --allow-cors'

## node
alias kng='killall node grunt gulp yarn tsc phantomjs flow webpack ngrok'
alias onn='npm i -g iterm2-tab-set avn avn-nvm avn-n cordova heroku yarn && yarn global add bolt'
# mocha netlify-cli puer
# yarn diff-so-fancy @atlassian/volt
#alias onn='volta install bolt iterm2-tab-set cordova heroku'

## projects
alias off='cd ~/work/src/off; git_offirmo.sh; tabset --badge 'off-X' --color "#F012BE"'
alias oa='cd ~/work/src/oa/online-adventures.github.io; git_offirmo.sh'
alias blog='cd ~/work/src/off/blog; git_offirmo.sh; rvm use ruby-2.1'
alias blogx='cd ~/work/src/off/x; git_offirmo.sh'
alias blogd='cd ~/work/src/off/my.dev.to; git_offirmo.sh'
alias cct='cd ~/work/src/off/clean-code-toolbox; git_offirmo.sh'
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
alias ode='cd ~/work/src/off/open-source-dev-env; git_offirmo.sh'
alias ogi='cd ~/work/src/off/offirmo.github.io; git_offirmo.sh; ./.tabset offirmo.net'


alias mono='cd ~/work/src/off/offirmo-monorepo; git_offirmo.sh; tabset --badge "mono" --color "#FF4136"'

alias mono01='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd better-console-group; ./.tabset mono01'
alias mono02='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd deferred; ./.tabset mono02'
alias mono03='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd globalthis-ponyfill; ./.tabset mono03'
alias mono04='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd murmurhash; ./.tabset mono04'
alias mono07='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd timestamps; ./.tabset mono07'
alias mono09='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd uuid; ./.tabset mono09'
alias mono10='cd ~/work/src/off/offirmo-monorepo/1-stdlib; git_offirmo.sh; cd tiny-singleton; ./.tabset mono10'

alias mono201='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd error-utils; ./.tabset mono201'
alias mono210='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd practical-logger-types; ./.tabset mono210'
alias mono211='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd practical-logger-core; ./.tabset mono211'
alias mono212='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd practical-logger-minimal-noop; ./.tabset mono212'
alias mono213='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd practical-logger-browser; ./.tabset mono213'
alias mono214='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd practical-logger-node; ./.tabset mono214'
alias mono219='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd prettify-any; ./.tabset mono219'
alias mono220='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd print-error-to-ansi; ./.tabset mono220'
alias mono221='cd ~/work/src/off/offirmo-monorepo/2-foundation; git_offirmo.sh; cd ts-types; ./.tabset mono221'

alias mono301='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd favicon-notifications; ./.tabset mono301'
alias mono302='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd features-detection-browser; ./.tabset mono302'
alias mono303='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd iframe-loading; ./.tabset mono303'
alias mono305='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd react-error-boundary; ./.tabset mono305'
alias mono306='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd view-css; ./.tabset mono306'
alias mono307='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd xoff; ./.tabset mono307'
alias mono308='cd ~/work/src/off/offirmo-monorepo/3-advanced--browser; git_offirmo.sh; cd embeddable-chat; ./.tabset mono308'

alias mono320='cd ~/work/src/off/offirmo-monorepo/3-advanced--isomorphic; git_offirmo.sh; cd async-utils; ./.tabset mono320'
alias mono321='cd ~/work/src/off/offirmo-monorepo/3-advanced--isomorphic; git_offirmo.sh; cd normalize-string; ./.tabset mono321'
alias mono322='cd ~/work/src/off/offirmo-monorepo/3-advanced--isomorphic; git_offirmo.sh; cd state-utils; ./.tabset mono322'
alias mono323='cd ~/work/src/off/offirmo-monorepo/3-advanced--isomorphic; git_offirmo.sh; cd unicode-data; ./.tabset mono323'

alias rtf0='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd rich-text-format; ./.tabset rtf0'
alias rtf1='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd rich-text-format-to-ansi; ./.tabset rtf1'
alias rtf2='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd rich-text-format-to-react; ./.tabset rtf2'
alias sec0='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd soft-execution-context; ./.tabset sec0'
alias sec1='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd soft-execution-context-node; ./.tabset sec1'
alias sec2='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd soft-execution-context-browser; ./.tabset sec2'
alias uda0='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-interface; ./.tabset uda0'
alias uda1='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-placeholder; ./.tabset uda1'
alias uda2='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-browser; ./.tabset uda2'
alias uda3='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-node; ./.tabset uda3'
alias mono331='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd view-chat; ./.tabset mono331'
alias mono332='cd ~/work/src/off/offirmo-monorepo/3-advanced--multi; git_offirmo.sh; cd view-chat-ui-tty; ./.tabset mono332'

alias mono351='cd ~/work/src/off/offirmo-monorepo/3-advanced--node; git_offirmo.sh; cd state-migration-tester; ./.tabset mono351'
alias clt='cd ~/work/src/off/offirmo-monorepo/3-advanced--node; git_offirmo.sh; cd cli-toolbox; ./.tabset clt'

alias ntc='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd node-typescript-compiler; ./.tabset node-tsc'
alias utt='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd unit-test-toolbox && ./.tabset utt'
alias monoT1='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd universal-debug-api-companion-webextension; ./.tabset monoT1'
alias monoT2='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd memories-sorter; ./.tabset monoT2'

alias monoX1='cd ~/work/src/off/offirmo-monorepo/5-incubator; git_offirmo.sh; cd active/rpg-frame; ./.tabset monoX1'
alias monoX2='cd ~/work/src/off/offirmo-monorepo/5-incubator; git_offirmo.sh; cd active/simple-upgradable-template; ./.tabset monoX2'

alias omr01='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd definitions; ./.tabset omr01'
alias omr11='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-armors; ./.tabset omr11'
alias omr12='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-weapons; ./.tabset omr12'
alias omr13='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-monsters; ./.tabset omr13'
alias omr14='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-adventures; ./.tabset omr14'
alias omr15='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd logic-shop; ./.tabset omr15'
alias omr21='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd rsrc-backgrounds; ./.tabset omr21'
alias omr22='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd rsrc-audio; ./.tabset omr22'
alias omr33='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-character; ./.tabset omr33'
alias omr34='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-codes; ./.tabset omr34'
alias omr35='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-energy; ./.tabset omr35'
alias omr36='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-engagement; ./.tabset omr36'
alias omr37='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-inventory; ./.tabset omr37'
alias omr38='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-meta; ./.tabset omr38'
alias omr39='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-prng; ./.tabset omr39'
alias omr40='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-progress; ./.tabset omr40'
alias omr41='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd state-wallet; ./.tabset omr41'
alias omr50='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-rich-text; ./.tabset omr50'
alias omr51='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-browser; ./.tabset omr51'
alias omr52='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd view-browser-react; ./.tabset omr52'
alias omr53='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd audio-browser; ./.tabset omr53'

alias monodbm='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd db-migrations && ./.tabset monodbm'
alias monodb='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd db && ./.tabset monodb'
alias monoi='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd api-interface && ./.tabset monoi'
alias monoc='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd api-client && ./.tabset monoc'
alias monof='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd functions && ./.tabset monof'
alias monoh='cd ~/work/src/off/offirmo-monorepo/A-apps/online-adventur.es; git_offirmo.sh; cd heroku && ./.tabset monoh'

alias bv01='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd state--isomorphic && ./.tabset bv01'
alias bv02='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd flux--isomorphic && ./.tabset bv02'
alias bv03='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd client--browser--core && ./.tabset bv03'

alias tbr01='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd state && ./.tabset tbr01'
alias tbr02='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd interfaces && ./.tabset tbr02'
alias tbr03='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd flux && ./.tabset tbr03'
alias tbr20='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd client-browser && ./.tabset tbr20'
alias tbr30='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd client-cordova && ./.tabset tbr30'
alias tbr40='cd ~/work/src/off/offirmo-monorepo/A-apps/the-boring-rpg; git_offirmo.sh; cd client-node && ./.tabset tbr40'

alias mini01='cd ~/work/src/off/offirmo-monorepo/B-minisites; git_offirmo.sh; cd practical-logger-minisite; ./.tabset mini01'
alias mini02='cd ~/work/src/off/offirmo-monorepo/B-minisites; git_offirmo.sh; cd universal-debug-api-minisite; ./.tabset mini02'

alias wiki='cd ~/work/src/off/wiki.wiki; git_offirmo.sh'
alias pre='cd ~/work/src/off/prefixed-log; git_offirmo.sh'
alias rxa='cd ~/work/src/off/rx-auto; git_offirmo.sh'
alias slr='cd ~/work/src/off/sync-local-repos; git_offirmo.sh; ./.tabset slr'
alias wmt='cd ~/work/src/off/web-module-toolbox; git_offirmo.sh'
alias wte='cd ~/work/src/off/web-tech-experiments; git_offirmo.sh; ./.tabset wte'
alias put='cd ~/work/src/off/promise-utils; git_offirmo.sh; tabset --badge "p-u" --color "#FF4136"'
