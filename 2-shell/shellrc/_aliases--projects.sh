#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_aliases--projects.sh] hello!"

source_bash_files_from_dir "$HOME/work/src/off/offirmo-monorepo/stack--current/0-meta/bin"

alias off='cd ~/work/src/off; git--offirmo.sh; tabset --badge 'off-X' --color "#F012BE"'
alias oa='cd ~/work/src/oa/online-adventures.github.io; git--offirmo.sh'
alias blog='cd ~/work/src/off/blog; git--offirmo.sh; rvm use ruby-2.1'
alias blogx='cd ~/work/src/off/x; git--offirmo.sh'
alias mdt='cd ~/work/src/off/my.dev.to; git--offirmo.sh'
alias cct='cd ~/work/src/off/clean-code-toolbox; git--offirmo.sh'
alias cro='cd ~/work/src/off/cross-js-env-tests; git--offirmo.sh'
alias hre='cd ~/work/src/off/coding-exercises-hr; git--offirmo.sh'
alias hwe='cd ~/work/src/off/hello-world-npm; git--offirmo.sh'
alias hwns='cd ~/work/src/off/hello-world-netlify-site; git--offirmo.sh'
alias hwnf='cd ~/work/src/off/hello-world-netlify-functions; git--offirmo.sh'
alias hwni='cd ~/work/src/off/hello-world-netlify-identity; git--offirmo.sh'
alias hwndb='cd ~/work/src/off/hello-world-netlify-db; git--offirmo.sh'
alias hwnp='cd ~/work/src/off/hello-world-netlify-pro; git--offirmo.sh'
alias hwgp='cd ~/work/src/off/hello-world-github-pages; git--offirmo.sh'
alias hwgpj='cd ~/work/src/off/hello-world-react-app; git--offirmo.sh'
alias hwra='cd ~/work/src/off/hello-world-react-app; git--offirmo.sh'
alias hwrat='cd ~/work/src/off/hello-world-react-app-typescript; git--offirmo.sh'
alias hwet='cd ~/work/src/off/hello-world-express-typescript; git--offirmo.sh'
alias hweta1='cd ~/work/src/off/hello-world-express-typescript-advanced-1; git--offirmo.sh'
alias mbo='cd ~/work/src/off/minisite-bookmarks-ghpages; nvm use; git--offirmo.sh'
alias ode='cd ~/work/src/off/open-source-dev-env; nvm use; git--offirmo.sh'
alias ogi='cd ~/work/src/off/offirmo.github.io; nvm use; git--offirmo.sh; tabset --color "#a4d4dd" --badge offirmo.net'


alias mono='cd ~/work/src/off/offirmo-monorepo; git--offirmo.sh; tabset --badge "mono" --color "#FF4136"'
alias mono1='cd ~/work/src/off/offirmo-monorepo/stack--2021; git--offirmo.sh; nvm use; tabset --badge "mono2021" --color "#FF0000"'
alias mono2='cd ~/work/src/off/offirmo-monorepo/stack--current; git--offirmo.sh; nvm install; tabset --badge "mono2022" --color "#FF4136"'
alias mono2test='cd ~/work/src/off/offirmo-monorepo/stack--current; nvm i; git--offirmo.sh; tabset --badge "mono2022" --color "#FF4136"'

alias ntc='    cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 0-meta/; cd build-tools/node-typescript-compiler;        tabset --color "#a4d4dd" --badge ntc'
alias utt='    cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 0-meta/; cd build-tools/toolbox--unit-tests;             tabset --color "#a4d4dd" --badge utt'

alias rtf0='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 1-isomorphic/; cd 2-libs--cross-cutting/rich-text-format;              tabset --color "#a4d4dd" --badge rtf0'
alias rtf1='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd rich-text-format--to-terminal;  tabset --color "#a4d4dd" --badge rtf1'
alias rtf2='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd rich-text-format--to-react;     tabset --color "#a4d4dd" --badge rtf2'

alias sec0='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 1-isomorphic/; cd 2-libs--cross-cutting/soft-execution-context;          tabset --color "#a4d4dd" --badge sec0'
alias sec1='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd soft-execution-context-node;     tabset --color "#a4d4dd" --badge sec1'
alias sec2='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd soft-execution-context-browser;  tabset --color "#a4d4dd" --badge sec2'

alias uda0='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 1-isomorphic/; cd 2-libs--cross-cutting/universal-debug-api-types;        tabset --color "#a4d4dd" --badge uda0'
alias uda1='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 1-isomorphic/; cd 2-libs--cross-cutting/universal-debug-api-placeholder;  tabset --color "#a4d4dd" --badge uda1'
alias uda2='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd universal-debug-api-browser;      tabset --color "#a4d4dd" --badge uda2'
alias uda3='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--multi/; cd universal-debug-api-node;         tabset --color "#a4d4dd" --badge uda3'

alias clt='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 3-advanced--node/; cd cli-toolbox; tabset --color "#a4d4dd" --badge clt'

#alias xxxmonoT1='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 4-tools/; cd universal-debug-api-companion-webextension; tabset --color "#a4d4dd" --badge monoT1'
alias mms=' cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 4-tools/; cd memories-sorter;   tabset --color "#a4d4dd" --badge mms'
alias spad='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 4-tools/; cd storypad;                        tabset --color "#a4d4dd" --badge spad'

alias inc01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd credits;                          tabset --color "#a4d4dd" --badge inc01'
alias inc30='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd data-structures;                  tabset --color "#a4d4dd" --badge inc30'
alias inc10='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd generator--html;                  tabset --color "#a4d4dd" --badge inc10'
alias inc11='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd generator--svg;                   tabset --color "#a4d4dd" --badge inc11'
alias inc12='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd generator--website-entry-points;  tabset --color "#a4d4dd" --badge inc12'
alias inc20='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 5-incubator/active/; cd x-sandbox;                        tabset --color "#a4d4dd" --badge inc20'
#alias monoX1='cd ~/work/src/off/offirmo-monorepo/5-incubator/; cd active/rpg-frame; tabset --color "#a4d4dd" --badge monoX1'
#alias monoX2='cd ~/work/src/off/offirmo-monorepo/5-incubator/; cd active/simple-upgradable-template; tabset --color "#a4d4dd" --badge monoX2'


alias omr01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd state--codes;       tabset --color "#a4d4dd" --badge omr01'
alias omr02='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd state--engagement;  tabset --color "#a4d4dd" --badge omr02'
alias omr03='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd state--prng;        tabset --color "#a4d4dd" --badge omr03'
alias omr04='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd state--meta;        tabset --color "#a4d4dd" --badge omr04'
alias omr51='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd assets--audio;      tabset --color "#a4d4dd" --badge omr51'
alias omr52='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd 9-rpg/; cd assets--cursors;    tabset --color "#a4d4dd" --badge omr52'


#alias ic01=' cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/immortal-clicker/;  cd sandbox;          tabset --color "#a4d4dd" --badge ic01'
#alias ikc01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/isekai-capitalist/; cd sandbox;          tabset --color "#a4d4dd" --badge ikc01'

alias tbrA01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-definitions;        tabset --color "#a4d4dd" --badge tbrA01'

alias tbrA11='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--armors;      tabset --color "#a4d4dd" --badge tbrA11'
alias tbrA12='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--weapons;     tabset --color "#a4d4dd" --badge tbrA12'
alias tbrA13='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--monsters;    tabset --color "#a4d4dd" --badge tbrA13'
alias tbrA14='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--adventures;  tabset --color "#a4d4dd" --badge tbrA14'
alias tbrA15='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--adventure--resolved;  tabset --color "#a4d4dd" --badge tbrA15'
alias tbrA16='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--shop;        tabset --color "#a4d4dd" --badge tbrA16'

alias tbrA21='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-state--character;   tabset --color "#a4d4dd" --badge tbrA21'
alias tbrA22='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-state--energy;      tabset --color "#a4d4dd" --badge tbrA22'
alias tbrA23='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-state--inventory;   tabset --color "#a4d4dd" --badge tbrA23'
alias tbrA24='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-state--progress;    tabset --color "#a4d4dd" --badge tbrA24'
alias tbrA25='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-state--wallet;      tabset --color "#a4d4dd" --badge tbrA25'
alias tbrA26='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l1-logic--power;       tabset --color "#a4d4dd" --badge tbrA26'

alias tbrA30='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l2-state;              tabset --color "#a4d4dd" --badge tbrA30'

alias tbrA31='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l3-interfaces;         tabset --color "#a4d4dd" --badge tbrA31'
alias tbrA40='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd l3-ui--rich-text;      tabset --color "#a4d4dd" --badge tbrA40'
#alias tbrA41='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd ui--browser-css     tabset --color "#a4d4dd" --badge tbrA41'
#alias tbrA42='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd ui--browser--react; tabset --color "#a4d4dd" --badge tbrA42'
#alias tbrA43='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd rsrc--backgrounds;  tabset --color "#a4d4dd" --badge tbrA43'

#alias xxtbrA43='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd audio-browser;      tabset --color "#a4d4dd" --badge tbrA43'
#alias xxtbrA22='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd rsrc--audio;        tabset --color "#a4d4dd" --badge tbrA22'
#alias xxomr01='cd ~/work/src/off/offirmo-monorepo/9-oh-my-rpg/; cd assets--background--artbreeder; tabset --color "#a4d4dd" --badge omr01'

alias tbrA99='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/the-boring-rpg/; cd x-sandbox;      tabset --color "#a4d4dd" --badge tbrA99'

alias sfrA99='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps--core/space-rpg/; cd x-sandbox;      tabset --color "#a4d4dd" --badge sfrA99'


alias monodbm='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd db-migrations; tabset --color "#a4d4dd" --badge monodbm'
alias monodb='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd db;             tabset --color "#a4d4dd" --badge monodb'
alias monoi='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd api-interface;   tabset --color "#a4d4dd" --badge monoi'
alias monoc='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd api-client;      tabset --color "#a4d4dd" --badge monoc'
alias monof='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd functions;       tabset --color "#a4d4dd" --badge monof'
alias monoh='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd B-apps--support/online-adventur.es/; cd heroku;          tabset --color "#a4d4dd" --badge monoh'

alias bv01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps/bhbv/; cd state--isomorphic;     tabset --color "#a4d4dd" --badge bv01'
alias bv02='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps/bhbv/; cd flux--isomorphic;      tabset --color "#a4d4dd" --badge bv02'
alias bv03='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd A-apps/bhbv/; cd client--browser--core; tabset --color "#a4d4dd" --badge bv03'

alias tbrC1='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd C-apps--clients/the-boring-rpg/; cd flux;            tabset --color "#a4d4dd" --badge tbrC1'
alias tbrC2='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd C-apps--clients/the-boring-rpg/; cd client--browser; tabset --color "#a4d4dd" --badge tbrC2'
alias tbrC3='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd C-apps--clients/the-boring-rpg/; cd client--cordova; tabset --color "#a4d4dd" --badge tbrC3'
alias tbrC4='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd C-apps--clients/the-boring-rpg/; cd client--node;    tabset --color "#a4d4dd" --badge tbrC4'

alias mini01='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd D-minisites/; cd practical-logger-minisite;    tabset --color "#a4d4dd" --badge mini01'
alias mini02='cd ~/work/src/off/offirmo-monorepo/stack--current/; nvm use; git--offirmo.sh; cd D-minisites/; cd universal-debug-api-minisite; tabset --color "#a4d4dd" --badge mini02'

alias wiki='cd ~/work/src/off/wiki.wiki; git--offirmo.sh'
alias slr=' cd ~/work/src/off/sync-local-repos; nvm use; git--offirmo.sh; tabset --color "#a4d4dd" --badge slr'
alias wte=' cd ~/work/src/off/web-tech-experiments; git--offirmo.sh; tabset --color "#a4d4dd" --badge wte'

#alias pre=' cd ~/work/src/off/prefixed-log; git--offirmo.sh'
#alias rxa=' cd ~/work/src/off/rx-auto; git--offirmo.sh'
#alias wmt=' cd ~/work/src/off/web-module-toolbox; git--offirmo.sh'
#alias put=' cd ~/work/src/off/promise-utils; git--offirmo.sh; tabset --badge "p-u" --color "#FF4136"'
