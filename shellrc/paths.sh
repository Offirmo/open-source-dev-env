#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/paths.sh"

#####################
## Set PATH, MANPATH, etc., for Homebrew.
if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
## required by homebrew?
export PATH="$PATH:/usr/local/sbin"


#####################
## node env
## yarn just in case
if command -v yarn &> /dev/null; then
	#echo "yarn PRESENT"
	export PATH="$PATH:$(yarn global bin)"
#else
#	echo "yarn ABSENT"
fi

#####################
## ruby env
## rvm
## (adapted from what is set on install)
if [[ -d "$HOME/.rvm/bin" ]]; then
	# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
	export PATH="$PATH:$HOME/.rvm/bin"
fi

#####################
## python env
## "userpath" ~ seems to be used by "virtualenv" (python)
export PATH="$PATH:~/.local/bin"


#####################
## our own stuff
PATH="$HOME/work/bin:$PATH"
PATH="$HOME/work/src/off/open-source-dev-env/bin:$PATH"
