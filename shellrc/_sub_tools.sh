#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/_sub_tools.sh"

## nvm
## (copied from what is set on install)
## https://github.com/nvm-sh/nvm#installing-and-updating

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [ -d "$NVM_DIR" ]; then
	echo "  * enabling nvm…"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	if [ $SHELL = "/bin/bash" ]; then
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	fi
fi

## avn
## (copied from what is set on install)
if [ -s "$HOME/.avn/bin/avn.sh" ]; then
	echo "  * enabling avn…"
	source "$HOME/.avn/bin/avn.sh" # load avn
fi

## rvm
## (copied from what is set on install)
## (note: PATH setup is in sibling file paths.sh)
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
	echo "  * enabling rvm…"
	source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

## jenv???
##export PATH="$HOME/.jenv/bin:$PATH"
##eval "$(jenv init -)"


## TODO check if iterm?
if [ $SHELL = "/bin/bash" ]; then
	if [ ! -s "$HOME/.iterm2_shell_integration.bash" ]; then
		curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
	fi
	source "$HOME/.iterm2_shell_integration.bash"
fi
if [ $SHELL = "/bin/zsh" ]; then
	if [ ! -s "$HOME/.iterm2_shell_integration.zsh" ]; then
		curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
	fi
	source "$HOME/.iterm2_shell_integration.zsh"
fi
