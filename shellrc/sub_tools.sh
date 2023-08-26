#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/sub_tools.sh"

## nvm
## (copied from what is set on install)
## https://github.com/nvm-sh/nvm#installing-and-updating
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## avn
## (copied from what is set on install)
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

## rvm
## (copied from what is set on install)
## (note: PATH setup is in sibling file paths.sh)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## jenv???
##export PATH="$HOME/.jenv/bin:$PATH"
##eval "$(jenv init -)"

test -e "$HOME/.iterm2_shell_integration.bash" && source "$HOME/.iterm2_shell_integration.bash"
