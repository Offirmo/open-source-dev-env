#@IgnoreInspection BashAddShebang
echo "* hello from: …open-source-dev-env/shellrc/offirmo_aliases.sh"

## standard Ubuntu "some more ls aliases"
## but we may not be on Ubuntu
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## mine ;)
alias x='exit'
#alias maintain='sudo apt-get update; sudo apt-get upgrade; curl -o- https://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash'
alias ydl='yt-dlp --verbose'


## tools
## works if installed via umake
alias ws='jetbrains-webstorm &'
## need to be built
alias rdm='~/work/src/rdm/bin/osx/debug/rdm'
## VSCode with custom folder
## cf. https://stackoverflow.com/a/73718136
alias vsc='HOME=~/work/src/off/open-source-dev-env/misc/vscode/home code --user-data-dir ~/work/src/off/open-source-dev-env/misc/vscode/data-dir'

## git
alias s='git status'
alias b='git branch'
alias ga='echo "Current git account :"; echo "   `git config --get user.name` (`git config --get user.email`)"'
alias gfp='git fetch && git pull --recurse-submodules'
alias ur='CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout master; git pull; git checkout $CURRENT_BRANCH; git fetch origin master; git rebase origin/master'
alias gac='git add . && git commit -m "TLDW :scream_cat:" --no-verify'
alias gitc='gitc.sh'

## JS
alias tpx='rm -rf node_modules .npm npm-debug.log package-lock.json yarn.lock yarn-error.log .yalc .awcache .parcel .parcel-cache bower_components typings'
#alias p='puer --no-launch --port 1981'
#alias p='puer --no-launch --port 1981 --allow-cors'

## node
alias kng='killall node grunt gulp yarn tsc phantomjs flow webpack ngrok'
# for bolt to work properly, it has to be installed globally via yarn
alias onn='npm install --location=global iterm2-tab-set avn avn-nvm avn-n netlify-cli heroku yarn && yarn global add bolt'
# cordova
#alias onn='npm i -g iterm2-tab-set avn avn-nvm avn-n cordova heroku yarn'

## projects
alias off='cd ~/work/src/off; git_offirmo.sh; tabset --badge 'off-X' --color "#F012BE"'
alias oa='cd ~/work/src/oa/online-adventures.github.io; git_offirmo.sh'
alias blog='cd ~/work/src/off/blog; git_offirmo.sh; rvm use ruby-2.1'
alias blogx='cd ~/work/src/off/x; git_offirmo.sh'
alias mdt='cd ~/work/src/off/my.dev.to; git_offirmo.sh'
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
alias ogi='cd ~/work/src/off/offirmo.github.io; git_offirmo.sh; tabset --color "#a4d4dd" --badge offirmo.net'


alias mono='cd ~/work/src/off/offirmo-monorepo; git_offirmo.sh; tabset --badge "mono" --color "#FF4136"'
alias mono2='cd ~/work/src/off/offirmo-monorepo/stack--2022; git_offirmo.sh; tabset --badge "mono2022" --color "#FF4136"'


alias ntc='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd node-typescript-compiler; tabset --color "#a4d4dd" --badge node-tsc'
alias utt='cd ~/work/src/off/offirmo-monorepo/4-tools; git_offirmo.sh; cd unit-test-toolbox && tabset --color "#a4d4dd" --badge utt'


alias mono100='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd ts-types;              tabset --color "#a4d4dd" --badge mono100'
alias mono101='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd deferred;              tabset --color "#a4d4dd" --badge mono101'
alias mono102='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd globalthis-ponyfill;   tabset --color "#a4d4dd" --badge mono102'
alias mono103='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd json-stable-stringify; tabset --color "#a4d4dd" --badge mono103'
alias mono105='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd promise-try;           tabset --color "#a4d4dd" --badge mono105'
alias mono106='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd timestamps;            tabset --color "#a4d4dd" --badge mono106'
alias mono107='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd tiny-singleton;        tabset --color "#a4d4dd" --badge mono107'
alias mono109='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd ts-utils;              tabset --color "#a4d4dd" --badge mono109'
#alias mono09='cd ~/work/src/off/offirmo-monorepo/stack--2022/1-stdlib; git_offirmo.sh; cd uuid; tabset --color "#a4d4dd" --badge mono09'

alias mono201='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd error-utils;                   tabset --color "#006EDB" --badge mono201'
alias mono202='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd murmurhash;                    tabset --color "#006EDB" --badge mono202'
alias mono210='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd practical-logger-types;        tabset --color "#006EDB" --badge mono210'
alias mono211='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd practical-logger-core;         tabset --color "#a4d4dd" --badge mono211'
alias mono212='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd practical-logger-minimal-noop; tabset --color "#a4d4dd" --badge mono212'
alias mono213='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd practical-logger-browser;      tabset --color "#a4d4dd" --badge mono213'
alias mono214='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd practical-logger-node;         tabset --color "#a4d4dd" --badge mono214'
alias mono219='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd prettify-any;                  tabset --color "#a4d4dd" --badge mono219'
alias mono220='cd ~/work/src/off/offirmo-monorepo/stack--2022/2-foundation; git_offirmo.sh; cd print-error-to-ansi;           tabset --color "#a4d4dd" --badge mono220'

alias mono301='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd css--reset;       tabset --color "#a4d4dd" --badge mono301'
alias mono302='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd css--foundation;  tabset --color "#a4d4dd" --badge mono302'
alias mono303='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd css--framework;   tabset --color "#a4d4dd" --badge mono303'
alias mono304='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd css--utils;       tabset --color "#a4d4dd" --badge mono303'
#alias mono301='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd favicon-notifications; tabset --color "#a4d4dd" --badge mono301'
alias mono310='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd features-detection-browser; tabset --color "#a4d4dd" --badge mono302'
alias mono311='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd iframe--chat; tabset --color "#a4d4dd" --badge mono303'
alias mono312='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd iframe--loading; tabset --color "#a4d4dd" --badge mono304'
alias mono313='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd react-error-boundary; tabset --color "#a4d4dd" --badge mono305'
#alias mono306='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd ui--browser--css; tabset --color "#a4d4dd" --badge mono306'
#alias mono307='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd storybook--utils; tabset --color "#a4d4dd" --badge mono307'
alias mono320='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--browser; git_offirmo.sh; cd xoff; tabset --color "#a4d4dd" --badge mono310'

alias mono330='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--isomorphic; git_offirmo.sh; cd async-utils; tabset --color "#a4d4dd" --badge mono320'
alias mono331='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--isomorphic; git_offirmo.sh; cd normalize-string; tabset --color "#a4d4dd" --badge mono321'
alias mono332='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--isomorphic; git_offirmo.sh; cd state-utils; tabset --color "#a4d4dd" --badge mono322'
alias mono333='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--isomorphic; git_offirmo.sh; cd unicode-data; tabset --color "#a4d4dd" --badge mono323'

alias rtf0='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd rich-text-format; tabset --color "#a4d4dd" --badge rtf0'
alias rtf1='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd rich-text-format-to-ansi; tabset --color "#a4d4dd" --badge rtf1'
alias rtf2='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd rich-text-format-to-react; tabset --color "#a4d4dd" --badge rtf2'
alias sec0='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd soft-execution-context; tabset --color "#a4d4dd" --badge sec0'
alias sec1='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd soft-execution-context-node; tabset --color "#a4d4dd" --badge sec1'
alias sec2='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd soft-execution-context-browser; tabset --color "#a4d4dd" --badge sec2'
alias uda0='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-types; tabset --color "#a4d4dd" --badge uda0'
alias uda1='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-placeholder; tabset --color "#a4d4dd" --badge uda1'
alias uda2='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-browser; tabset --color "#a4d4dd" --badge uda2'
alias uda3='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd universal-debug-api-node; tabset --color "#a4d4dd" --badge uda3'
alias mono341='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd view-chat; tabset --color "#a4d4dd" --badge mono331'
alias mono342='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--multi; git_offirmo.sh; cd view-chat-ui-tty; tabset --color "#a4d4dd" --badge mono332'

alias mono351='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--node; git_offirmo.sh; cd state-migration-tester; tabset --color "#a4d4dd" --badge mono351'
alias clt='cd ~/work/src/off/offirmo-monorepo/stack--2022/3-advanced--node; git_offirmo.sh; cd cli-toolbox; tabset --color "#a4d4dd" --badge clt'

alias monoT1='cd ~/work/src/off/offirmo-monorepo/stack--2022/4-tools; git_offirmo.sh; cd universal-debug-api-companion-webextension; tabset --color "#a4d4dd" --badge monoT1'
alias monoT2='cd ~/work/src/off/offirmo-monorepo/stack--2022/4-tools; git_offirmo.sh; cd memories-sorter; tabset --color "#a4d4dd" --badge monoT2'

alias monoX1='cd ~/work/src/off/offirmo-monorepo/5-incubator; git_offirmo.sh; cd active/rpg-frame; tabset --color "#a4d4dd" --badge monoX1'
alias monoX2='cd ~/work/src/off/offirmo-monorepo/5-incubator; git_offirmo.sh; cd active/simple-upgradable-template; tabset --color "#a4d4dd" --badge monoX2'

alias omr01='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd assets--background--artbreeder; tabset --color "#a4d4dd" --badge omr01'
alias omr50='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg; git_offirmo.sh; cd ui--browser--css; tabset --color "#a4d4dd" --badge omr50'
##alias omr01='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd definitions; tabset --color "#a4d4dd" --badge omr01'

alias tbrA01='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd definitions;        tabset --color "#a4d4dd" --badge tbrA01'
alias tbrA11='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--armors;      tabset --color "#a4d4dd" --badge tbrA11'
alias tbrA12='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--weapons;     tabset --color "#a4d4dd" --badge tbrA12'
alias tbrA13='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--monsters;    tabset --color "#a4d4dd" --badge tbrA13'
alias tbrA14='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--adventures;  tabset --color "#a4d4dd" --badge tbrA14'
alias tbrA15='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--shop;        tabset --color "#a4d4dd" --badge tbrA16'
alias tbrA16='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd logic--power;       tabset --color "#a4d4dd" --badge tbrA15'
alias tbrA21='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd rsrc--backgrounds;  tabset --color "#a4d4dd" --badge tbrA21'
alias tbrA22='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd rsrc--audio;        tabset --color "#a4d4dd" --badge tbrA22'
alias tbrA33='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--character;   tabset --color "#a4d4dd" --badge tbrA33'
alias tbrA34='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--codes;       tabset --color "#a4d4dd" --badge tbrA34'
alias tbrA35='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--energy;      tabset --color "#a4d4dd" --badge tbrA35'
alias tbrA36='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--engagement;  tabset --color "#a4d4dd" --badge tbrA36'
alias tbrA37='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--inventory;   tabset --color "#a4d4dd" --badge tbrA37'
alias tbrA38='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--meta;        tabset --color "#a4d4dd" --badge tbrA38'
alias tbrA39='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--prng;        tabset --color "#a4d4dd" --badge tbrA39'
alias tbrA40='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--progress;    tabset --color "#a4d4dd" --badge tbrA40'
alias tbrA41='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state--wallet;      tabset --color "#a4d4dd" --badge tbrA41'
alias tbrA50='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd ui--rich-text;      tabset --color "#a4d4dd" --badge tbrA50'
alias tbrA51='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd ui--browser-css     tabset --color "#a4d4dd" --badge tbrA51'
alias tbrA52='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd ui--browser--react; tabset --color "#a4d4dd" --badge tbrA52'
alias tbrA53='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd audio-browser;      tabset --color "#a4d4dd" --badge tbrA53'
alias tbrA60='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd state;              tabset --color "#a4d4dd" --badge tbrA60'
alias tbrAC1='cd ~/work/src/off/offirmo-monorepo/A-apps--core/the-boring-rpg; git_offirmo.sh; cd interfaces;         tabset --color "#a4d4dd" --badge tbrAC1'

alias icA01='cd ~/work/src/off/offirmo-monorepo/A-apps--core/isekai-capitalist; git_offirmo.sh; cd sandbox;          tabset --color "#a4d4dd" --badge icA01'

alias monodbm='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd db-migrations; tabset --color "#a4d4dd" --badge monodbm'
alias monodb='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd db;             tabset --color "#a4d4dd" --badge monodb'
alias monoi='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd api-interface;   tabset --color "#a4d4dd" --badge monoi'
alias monoc='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd api-client;      tabset --color "#a4d4dd" --badge monoc'
alias monof='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd functions;       tabset --color "#a4d4dd" --badge monof'
alias monoh='cd ~/work/src/off/offirmo-monorepo/B-apps--support/online-adventur.es; git_offirmo.sh; cd heroku;          tabset --color "#a4d4dd" --badge monoh'

alias bv01='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd state--isomorphic;     tabset --color "#a4d4dd" --badge bv01'
alias bv02='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd flux--isomorphic;      tabset --color "#a4d4dd" --badge bv02'
alias bv03='cd ~/work/src/off/offirmo-monorepo/A-apps/bhbv; git_offirmo.sh; cd client--browser--core; tabset --color "#a4d4dd" --badge bv03'

alias tbrC1='cd ~/work/src/off/offirmo-monorepo/C-apps--clients/the-boring-rpg; git_offirmo.sh; cd flux;            tabset --color "#a4d4dd" --badge tbrC1'
alias tbrC2='cd ~/work/src/off/offirmo-monorepo/C-apps--clients/the-boring-rpg; git_offirmo.sh; cd client--browser; tabset --color "#a4d4dd" --badge tbrC2'
alias tbrC3='cd ~/work/src/off/offirmo-monorepo/C-apps--clients/the-boring-rpg; git_offirmo.sh; cd client--cordova; tabset --color "#a4d4dd" --badge tbrC3'
alias tbrC4='cd ~/work/src/off/offirmo-monorepo/C-apps--clients/the-boring-rpg; git_offirmo.sh; cd client--node;    tabset --color "#a4d4dd" --badge tbrC4'

alias mini01='cd ~/work/src/off/offirmo-monorepo/D-minisites; git_offirmo.sh; cd practical-logger-minisite;    tabset --color "#a4d4dd" --badge mini01'
alias mini02='cd ~/work/src/off/offirmo-monorepo/D-minisites; git_offirmo.sh; cd universal-debug-api-minisite; tabset --color "#a4d4dd" --badge mini02'

alias wiki='cd ~/work/src/off/wiki.wiki; git_offirmo.sh'
alias pre='cd ~/work/src/off/prefixed-log; git_offirmo.sh'
alias rxa='cd ~/work/src/off/rx-auto; git_offirmo.sh'
alias slr='cd ~/work/src/off/sync-local-repos; git_offirmo.sh; tabset --color "#a4d4dd" --badge slr'
alias wmt='cd ~/work/src/off/web-module-toolbox; git_offirmo.sh'
alias wte='cd ~/work/src/off/web-tech-experiments; git_offirmo.sh; tabset --color "#a4d4dd" --badge wte'
alias put='cd ~/work/src/off/promise-utils; git_offirmo.sh; tabset --badge "p-u" --color "#FF4136"'
