#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/_paths.sh"

#####################
## generic
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.local/bin"

#####################
## Set PATH, MANPATH, etc., for Homebrew.
## critical to even access "brew"
if command -v brew &> /dev/null; then
	echo "  * enabling brew…"
	eval "$(brew shellenv)"
else
	# brew is not even available, try to locate it in known locations:
	if [ -f "/opt/homebrew/bin/brew" ]; then
		echo "  * enabling brew…"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
	if [ -f "/usr/local/bin/brew" ]; then
		echo "  * enabling brew…"
		eval "$(/usr/local/bin/brew shellenv)"
	fi
fi

#####################
## node env
## yarn just in case
if command -v yarn &> /dev/null; then
	echo "  * enabling yarn…"
	export PATH="$PATH:$(yarn global bin)"
#else
#	echo "yarn ABSENT"
fi

#####################
## ruby env
## rvm
## (adapted from what is set on install)
if [[ -d "$HOME/.rvm/bin" ]]; then
	echo "  * enabling rvm…"
	# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
	export PATH="$PATH:$HOME/.rvm/bin"
fi

#####################
## python env
## "userpath" ~ seems to be used by "virtualenv" (python)


#####################
## docker, if installed in user only (non standard)
## https://docs.docker.com/desktop/mac/permission-requirements/#installing-symlinks
## TODO
#Docker CLI tools are installed under $HOME/.docker/bin. Note: You need to manually add $HOME/.docker/bin to your PATH


#####################
## our own stuff
PATH="$HOME/work/bin:$PATH"
PATH="$HOME/work/src/off/open-source-dev-env/bin:$PATH"
