#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/_paths.sh"

#####################
## generic
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.local/bin"

#####################
## required by homebrew?
if command -v brew &> /dev/null; then
	## Set PATH, MANPATH, etc., for Homebrew.
	eval "$(brew shellenv)"
fi

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


#####################
## our own stuff
PATH="$HOME/work/bin:$PATH"
PATH="$HOME/work/src/off/open-source-dev-env/bin:$PATH"
