#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_aliases--projects.sh] hello!"

export OFFIRMO_ROOT=${OFFIRMO_ROOT:-"$HOME/work/src/x-external/off"};
#echo "OFFIRMO_ROOT : $OFFIRMO_ROOT"

alias off=' cd $OFFIRMO_ROOT;                                      git--offirmo.sh; tabset --badge 'off' --color "#F012BE"'
alias blog='cd $OFFIRMO_ROOT/offirmo/blog;                         git--offirmo.sh; rvm use ruby-2.1'
alias mbo=' cd $OFFIRMO_ROOT/offirmo/minisite-bookmarks-ghpages;   git--offirmo.sh; nvm use'
alias ode=' cd $OFFIRMO_ROOT/offirmo/open-source-dev-env; nvm use; git--offirmo.sh'
alias slr=' cd $OFFIRMO_ROOT/offirmo/sync-local-repos; nvm use;    git--offirmo.sh; tabset --badge slr --color "#a4d4dd"'
alias wte=' cd $OFFIRMO_ROOT/offirmo/web-tech-experiments;         git--offirmo.sh; tabset --badge wte --color "#a4d4dd"'

alias oa='cd ~/work/src/x-external/oa/online-adventures.github.io; git--offirmo.sh'
alias blogx='cd $OFFIRMO_ROOT/x;               git--offirmo.sh'
alias mdt='cd $OFFIRMO_ROOT/my.dev.to;         git--offirmo.sh'
alias ogi='cd $OFFIRMO_ROOT/offirmo.github.io; git--offirmo.sh; nvm use; tabset --color "#a4d4dd" --badge offirmo.net'
alias wiki='cd $OFFIRMO_ROOT/wiki.wiki;        git--offirmo.sh'

export OFFIRMO_MONOREPO_ROOT=${OFFIRMO_MONOREPO_ROOT:-"$OFFIRMO_ROOT/offirmo/offirmo-monorepo"};
#echo "OFFIRMO_MONOREPO_ROOT : $OFFIRMO_MONOREPO_ROOT"

alias mono='  cd $OFFIRMO_MONOREPO_ROOT;                git--offirmo.sh;              tabset --badge "mono"  --color "#FF4136"'
alias mono1=' cd $OFFIRMO_MONOREPO_ROOT/stack--current; git--offirmo.sh; nvm install; tabset --badge "mono1" --color "#FF4136"'
alias mono1s='cd $OFFIRMO_MONOREPO_ROOT/stack--current/0-meta/build-tools/monorepo; git--offirmo.sh; nvm install'
alias mono3=' cd $OFFIRMO_MONOREPO_ROOT/stack--web3;    git--offirmo.sh;              tabset --badge "mono3" --color "#FF4136"'

[ -d "$OFFIRMO_MONOREPO_ROOT/stack--current/0-meta/bin" ] && source_bash_files_from_dir "$OFFIRMO_MONOREPO_ROOT/stack--current/0-meta/bin"
