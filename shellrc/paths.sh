echo "* hello from: …open-source-dev-env/shellrc/paths.sh"

## Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
## required by homebrew?
export PATH="/usr/local/sbin:$PATH"

## "userpath" ~ seems to be used by "virtualenv" (python)
export PATH="$PATH:~/.local/bin"

## our own stuff
PATH=$HOME/work/bin:$PATH
PATH=$HOME/work/src/off/open-source-dev-env/bin:$PATH
