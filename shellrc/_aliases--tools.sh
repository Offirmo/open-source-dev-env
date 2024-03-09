#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* hello from: …open-source-dev-env/shellrc/_aliases--tools.sh"

## standard Ubuntu "some more ls aliases"
## should work on any unix-like
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## helper for MacOS
## https://github.com/memkind/memkind/issues/33#issuecomment-648317086
alias nproc="sysctl -n hw.logicalcpu"

## my own
alias x='exit'
alias ydl='yt-dlp --verbose'


## tools
## works if installed via umake
#alias ws='jetbrains-webstorm &'
## need to be built
#alias rdm='~/work/src/rdm/bin/osx/debug/rdm'
## VSCode with custom folder
## cf. https://stackoverflow.com/a/73718136
alias vsc='HOME=~/work/src/off/open-source-dev-env/misc/vscode/home code --user-data-dir ~/work/src/off/open-source-dev-env/misc/vscode/data-dir'
#  --password-store=basic
# mkdir ~/.local/share/keyrings


## git
alias s='git status'
alias b='git branch'
alias ga='echo "Current git account :"; echo "   `git config --get user.name` (`git config --get user.email`)"'
alias gfp='git fetch && git pull --recurse-submodules'
alias ur='CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`; git checkout master; git pull; git checkout $CURRENT_BRANCH; git fetch origin master; git rebase origin/master'
alias gac='git add . && git commit -m "TLDW :scream_cat:" --no-verify'
alias gitc='gitc.sh'

## JS
alias tpx='rm -rf node_modules/ .npm npm-debug.log package-lock.json yarn.lock yarn-error.log .yarn/cache/ .yalc .awcache/ .parcel/ .parcel-cache/ bower_components/ typings/'
#alias p='puer --no-launch --port 1981'
#alias p='puer --no-launch --port 1981 --allow-cors'

## node
alias kng='killall node grunt gulp yarn tsc phantomjs flow webpack ngrok'
# for bolt to work properly, it has to be installed globally via yarn
alias onn='npm install --global iterm2-tab-set yalc yarn && yarn global add bolt'
# 2024/02 avn no longerwork avn avn-nvm
# 2023/10 TODO yarn 4 but very hard to work
#alias onn='corepack enable && npm install --global iterm2-tab-set avn avn-nvm'
# netlify-cli cordova heroku avn-n
#alias onn='npm i -g iterm2-tab-set avn avn-nvm avn-n cordova heroku yarn'
