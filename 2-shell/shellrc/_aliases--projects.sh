#@IgnoreInspection BashAddShebang
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S)     ↳ […ode/…/_aliases--projects.sh] hello!"

export OFFIRMO_ROOT=${OFFIRMO_ROOT:-"$HOME/work/src/x-external/off"};
#echo "OFFIRMO_ROOT : $OFFIRMO_ROOT"

alias off=' cd $OFFIRMO_ROOT;                                      git--offirmo.sh; tabset --badge off --color "#F012BE"'
alias blog='cd $OFFIRMO_ROOT/offirmo/blog;                         git--offirmo.sh; rvm use ruby-2.1'
alias mbo=' cd $OFFIRMO_ROOT/offirmo/minisite-bookmarks-ghpages;   git--offirmo.sh'
alias ode=' cd $OFFIRMO_ROOT/offirmo/open-source-dev-env;          git--offirmo.sh'
alias slr=' cd $OFFIRMO_ROOT/offirmo/sync-local-repos;             git--offirmo.sh; tabset --badge slr --color "#a4d4dd"'
alias wte=' cd $OFFIRMO_ROOT/offirmo/web-tech-experiments;         git--offirmo.sh; tabset --badge wte --color "#a4d4dd"'

alias oa='cd ~/work/src/x-external/oa/online-adventures.github.io; git--offirmo.sh'
alias blogx='cd $OFFIRMO_ROOT/x;               git--offirmo.sh'
alias mdt='cd $OFFIRMO_ROOT/my.dev.to;         git--offirmo.sh'
alias ogi='cd $OFFIRMO_ROOT/offirmo.github.io; git--offirmo.sh; tabset --color "#a4d4dd" --badge offirmo.net'
alias wiki='cd $OFFIRMO_ROOT/wiki.wiki;        git--offirmo.sh'


PCRK_PATH="$HOME/work/src/x-external/off/offirmo-team/private-compounding-repository-of-knowledge"
[ -d "$PCRK_PATH" ] && source "$PCRK_PATH/mono--current/.monorepo/bin/aliases.sh"

alias mono='  cd $PCRK_PATH;               git--offirmo.sh;              tabset --badge "mono"  --color "#FF4136"'
alias mono1=' cd $PCRK_PATH/mono--current; git--offirmo.sh;              tabset --badge "mono1" --color "#FF4136"'
alias mono3=' cd $PCRK_PATH/mono--web3;    git--offirmo.sh;              tabset --badge "mono3" --color "#FF4136"'
