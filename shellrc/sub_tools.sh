echo "* hello from: …open-source-dev-env/shellrc/sub_tools.sh"

## nvm
## (copied from what is set on install)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## avn
## (copied from what is set on install)
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

## rvm
## (copied from what is set on install)
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Java
## taken from???
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=$(/usr/libexec/java_home --version 1.8)

## jenv???
##export PATH="$HOME/.jenv/bin:$PATH"
##eval "$(jenv init -)"

test -e "/Users/sam/.iterm2_shell_integration.bash" && source "/Users/sam/.iterm2_shell_integration.bash"
