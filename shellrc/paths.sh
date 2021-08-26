echo "* hello from: …open-source-dev-env/shellrc/paths.sh"

PATH=$HOME/work/bin:$PATH
PATH=$HOME/work/src/off/open-source-dev-env/bin:$PATH

## "userpath" ~ seems to be used by "virtualenv" (python)
export PATH="$PATH:~/.local/bin"
