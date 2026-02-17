#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_aliases--projects.sh] hello!"

alias off=' cd ~/work/src/x-external/off; git--offirmo.sh; tabset --badge 'off-X' --color "#F012BE"'
alias blog='cd ~/work/src/x-external/off/offirmo/blog; git--offirmo.sh; rvm use ruby-2.1'
alias mbo=' cd ~/work/src/x-external/off/offirmo/minisite-bookmarks-ghpages; nvm use; git--offirmo.sh'
alias ode=' cd ~/work/src/x-external/off/offirmo/open-source-dev-env; nvm use; git--offirmo.sh'
alias slr=' cd ~/work/src/x-external/off/offirmo/sync-local-repos; nvm use; git--offirmo.sh; tabset --color "#a4d4dd" --badge slr'
alias wte=' cd ~/work/src/x-external/off/offirmo/web-tech-experiments; git--offirmo.sh; tabset --color "#a4d4dd" --badge wte'

alias oa='cd ~/work/src/x-external/oa/online-adventures.github.io; git--offirmo.sh'
alias blogx='cd ~/work/src/x-external/off/x; git--offirmo.sh'
alias mdt='cd ~/work/src/x-external/off/my.dev.to; git--offirmo.sh'
alias ogi='cd ~/work/src/x-external/off/offirmo.github.io; nvm use; git--offirmo.sh; tabset --color "#a4d4dd" --badge offirmo.net'
alias wiki='cd ~/work/src/x-external/off/wiki.wiki; git--offirmo.sh'

[ -d "$HOME/work/src/x-external/off/offirmo/offirmo-monorepo/stack--current/0-meta/bin" ] && source_bash_files_from_dir "$HOME/work/src/x-external/off/offirmo/offirmo-monorepo/stack--current/0-meta/bin"
