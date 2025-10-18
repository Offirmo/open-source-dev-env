#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_sub_tools.sh] hello!"


############ TOOL -- iTerm ############
## https://iterm2.com/documentation-shell-integration.html
## last reviewed: 2023/09
if [ $ITERM_SESSION_ID ]; then

	## put current directory in iTerm tab title
	## source: https://gist.github.com/phette23/5270658 (modified, cf. https://gist.github.com/phette23/5270658?permalink_comment_id=4683975#gistcomment-4683975)
	## Original:  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
	export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }echo -ne \"\033];\${PWD##*/}\007\""
	# Piece-by-Piece Explanation:
	# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
	# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
	# the $PROMPT_COMMAND environment variable is executed every time a command is run
	# see: ss64.com/bash/syntax-prompt.html
	# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
	# echo -ne "\033;foo\007" sets the current tab title to "foo"
	# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
	# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
	# see: ss64.com/bash/echo.html for echo documentation
	# we set the title to ${PWD##*/} which is just the current dir, not full path
	# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
	# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
	# voilà!

	case "$SHELL" in
		"/bin/bash")
			if [ ! -f ~/.iterm2_shell_integration.bash ]; then
				echo "  * downloading iTerm2 integration… (bash)"
				curl https://iterm2.com/shell_integration/bash --location --output ~/.iterm2_shell_integration.bash
			fi
			echo "  * enabling iTerm2 integration… (bash)"
			source ~/.iterm2_shell_integration.bash
			;;
		"/bin/zsh")
			if [ ! -f ~/.iterm2_shell_integration.zsh ]; then
				echo "  * downloading iTerm2 integration… (zsh)"
				curl https://iterm2.com/shell_integration/zsh --location --output ~/.iterm2_shell_integration.zsh
			fi
			echo "  * enabling iTerm2 integration… (zsh)"
			source ~/.iterm2_shell_integration.zsh
			;;
	esac
fi



############ TOOL -- Jetbrains Toolbox ############
#export PATH="$PATH:~/Library/Application Support/JetBrains/Toolbox/scripts"



############ PKG MANAGER -- Homebrew ############
## critical to even access "brew"
if command -v brew &> /dev/null; then
	echo "  * enabling brew… (from $(which brew))"
	eval "$(brew shellenv)"
else
	# brew is not even available, try to locate it in known locations:
	if [ -f "/opt/homebrew/bin/brew" ]; then
		echo "  * enabling brew… (from /opt/homebrew/bin/brew)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
	if [ -f "/usr/local/bin/brew" ]; then
		echo "  * enabling brew… (from /usr/local/bin/brew)"
		eval "$(/usr/local/bin/brew shellenv)"
	fi
fi
## enable brew autocomplete
if command -v brew &> /dev/null; then
	case "$SHELL" in
		"/bin/bash")
			if [ -f $(brew --prefix)/etc/bash_completion ]; then
				. $(brew --prefix)/etc/bash_completion
			fi
		;;
	esac
fi



############ DEV ENV -- ECMASCRIPT ############
## nvm
## (copied from what is set on install)
## https://github.com/nvm-sh/nvm#installing-and-updating
if [[ -n "$NVM_DIR" ]]; then
	echo "  * enabling nvm… already enabled"
else
	## TODO FIX
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	if [ -d "$NVM_DIR" ]; then
		echo "  * enabling nvm… (\$NVM_DIR = $NVM_DIR)"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
		if [ $SHELL = "/bin/bash" ]; then
			[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
		fi
	fi
fi
if command -v nvm_find_up &> /dev/null; then
	echo "    * enabling cdnvm…"

	## This command must be RESILIENT to not break starting shells
	cdnvm() {
		command cd "$@" || return $?
		nvm_path="$(nvm_find_up .nvmrc | command tr -d '\n')"

		# If there are no .nvmrc file, use the default nvm version
		if [[ ! $nvm_path = *[^[:space:]]* ]]; then
			echo "cdnvm = no .nvmrc found"
			declare default_version
			default_version="$(nvm version default)"

			# If there is no default version, set it to `node`
			# This will use the latest version on your machine
			if [ $default_version = 'N/A' ]; then
				nvm alias default node
				default_version=$(nvm version default)
			fi

			# If the current version is not the default version, set it to use the default version
			if [ "$(nvm current)" != "${default_version}" ]; then
				nvm use default
			fi
		elif [[ -s "${nvm_path}/.nvmrc" && -r "${nvm_path}/.nvmrc" ]]; then
			declare nvm_version
			nvm_version=$(<"${nvm_path}"/.nvmrc)
			echo "cdnvm = found $nvm_version"

			declare locally_resolved_nvm_version
			# `nvm ls` will check all locally-available versions
			# If there are multiple matching versions, take the latest one
			# Remove the `->` and `*` characters and spaces
			# `locally_resolved_nvm_version` will be `N/A` if no local versions are found
			locally_resolved_nvm_version=$(nvm ls --no-colors "${nvm_version}" | command tail -1 | command tr -d '\->*' | command tr -d '[:space:]')

			# If it is not already installed, install it
			# `nvm install` will implicitly use the newly-installed version
			if [ "${locally_resolved_nvm_version}" = 'N/A' ]; then
				nvm install "${nvm_version}" || echo "cdnvm: ⚠️ failed to install requested ${nvm_version}, please troubleshoot!"
			elif [ "$(nvm current)" != "${locally_resolved_nvm_version}" ]; then
				nvm use "${nvm_version}"
			fi
		fi
	}

	alias cd='cdnvm'
	cdnvm "$PWD" || exit
fi

## avn (auto nvm use on changing dirs)
## (copied from what is set on install)
## Note: as of 2024/03 it's not working
if [ -s "${HOME}/.avn/bin/avn.sh" ]; then
	echo "  * enabling avn…"
	source "${HOME}/.avn/bin/avn.sh"
fi

## yarn
if command -v yarn &> /dev/null; then
	if [[ $(yarn -v) = 1.* ]]; then
		echo "  * enabling yarn v1…"
		export PATH="$PATH:$(yarn global bin)"
	else
		echo "  * enabling yarn v2+… ???"
	fi
else
	## yarn is not available
	## this may be normal if using a env manager with different yarn (ex. nvm)
	## however we need to preemptively add yarn global path to $PATH
	## cf. https://github.com/yarnpkg/yarn/issues/1027#issuecomment-336644907
	if [ -d ~/.yarn/bin ]; then
		export PATH="$PATH:~/.yarn/bin"
	else
		echo "XXX yarn MISSING?"
	fi
fi


#flyctl was installed successfully to /Users/.../.fly/bin/flyctl
#Manually add the directory to your $HOME/.bash_profile (or similar)
#  export FLYCTL_INSTALL="/Users/xxx/.fly"
#  export PATH="$FLYCTL_INSTALL/bin:$PATH"
if [ -d "${HOME}/.fly/" ]; then
	echo "  * enabling flyctl…"
	export PATH="$PATH:~/.fly/bin"
fi


############ DEV ENV -- PYTHON ############
## prevents installing libs without an active virtualenv
## https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
export PIP_REQUIRE_VIRTUALENV=true
## "userpath" ~ seems to be used by "virtualenv" (python)



############ DEV ENV -- RUBY ############
## rvm
## (copied from what is set on install)
## (note: PATH setup is in sibling file paths.sh)
## TODO REVIEW (long time not used)
if [ -d "${HOME}/.rvm/bin" ]; then
	#echo "  * enabling rvm…"
	# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
	export PATH="$PATH:~/.rvm/bin"
fi
if [ -s "${HOME}/.rvm/scripts/rvm" ]; then
	echo "  * enabling rvm…"
	source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi



############ DEV ENV -- JAVA ############
## taken from???
if [[ -f /usr/libexec/java_home ]]; then
	if ! /usr/libexec/java_home 1>/dev/null 2>&1; then
		## most likely "The operation couldn’t be completed. Unable to locate a Java Runtime."
		## do nothing
		DO_NOTHING=1
	else
		export JAVA_HOME=$(/usr/libexec/java_home)
	fi
fi

## jenv???
##export PATH="~/.jenv/bin:$PATH"
##eval "$(jenv init -)"



############ DEV ENV -- Rust ############
## taken from the install logs
if [ -d "${HOME}/.cargo/env" ]; then
	echo "  * enabling cargo (Rust)…"
	source "$HOME/.cargo/env"
fi


############ TOOL -- docker ############
## if installed in user only (non standard)
## https://www.docker.com/products/docker-desktop/
if [ -d "${HOME}/.docker/bin" ]; then
	echo "  * enabling docker…"
	export PATH="$PATH:~/.docker/bin"
fi
