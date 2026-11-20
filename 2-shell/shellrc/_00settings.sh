#@IgnoreInspection BashAddShebang
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S)     ↳ […ode/…/_00settings.sh] hello!" >&2

## Add this to your profile ONLY IF OFFIRMO
## - enable dedicated special ssh key
## - instructs some lib to private APIs and tools (ex. SXC)
## - disable sentry and other telemetry on own apps during debug
#export IS_OFFIRMO_DEV_ENV=1


## exported variables = in ../_.profile.sh


## remove duplicated bash history https://askubuntu.com/a/15929
## (NOT exported: only read by the current shell)
HISTCONTROL=ignoreboth:erasedups
## zsh equivalent (ignorespace + erasedups, which implies ignoredups)
[ -n "$ZSH_VERSION" ] && setopt HIST_IGNORE_SPACE HIST_IGNORE_ALL_DUPS


## improve stuff with colors
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac


if [ -n "$BASH_VERSION" ]; then
	## better prompt
	if [ "$color_prompt" = yes ]; then
		## remove "user + machine" (not very useful if always the same)
		#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
		PS1='ℹ️  \[\033[01;34m\]\w\[\033[00m\] ▶️  '
	else
		PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
elif [ -n "$ZSH_VERSION" ]; then
	DO_NOTHING=1
fi




## enable color support of ls and also add handy aliases
if [ "$color_prompt" = yes ]; then
	## BSD ls (macOS): colors via $CLICOLOR (../_.profile.sh)
	## NOT "ls -G": on GNU ls (Linux, or brew's coreutils "gnubin" ahead in the PATH) -G means --no-group = no colors + no group column
	## NOT "ls --color=auto" on macOS: only recent BSD ls supports it, an older one would make ls fail entirely
	## -> branching on $OSTYPE (builtin var = no fork, unlike a feature test)
	## known gap: macOS + GNU ls ahead in the PATH = no colors (harmless)
	if [[ "$OSTYPE" == darwin* ]]; then
		alias ls='ls -p'
	else
		alias ls='ls --color=auto -p'
	fi

	## TODO evaluate
	#export LSCOLORS=ExFxBxDxCxegedabagacad

	alias grep='grep --color=auto'
	## NOT the "egrep"/"fgrep" binaries: GNU grep >= 3.8 warns "egrep is obsolescent" on every call
	alias fgrep='grep --fixed-strings --color=auto'
	alias egrep='grep --extended-regexp --color=auto'
fi

unset color_prompt force_color_prompt


## https://docs.reactioncommerce.com/docs/requirements
## outdated, check with ulimit -l = unlimited
#ulimit -n 65536 65536
