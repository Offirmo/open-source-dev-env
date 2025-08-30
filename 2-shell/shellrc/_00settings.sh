#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_00settings.sh] hello!"

## Add this to your profile ONLY IF OFFIRMO
## - enable dedicated special ssh key
## - instructs some lib to private APIs and tools (ex. SXC)
## - disable sentry and other telemetry on own apps during debug
#export IS_OFFIRMO_DEV_ENV=1


## asks tools to not track https://consoledonottrack.com/
## https://turborepo.com/docs/telemetry#how-do-i-opt-out
export DO_NOT_TRACK=1


## remove duplicated bash history https://askubuntu.com/a/15929
export HISTCONTROL=ignoreboth:erasedups


## improve stuff with colors
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac


## better prompt
if [ "$color_prompt" = yes ]; then
	## remove "user + machine" (not very useful if always the same)
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='ℹ️  \[\033[01;34m\]\w\[\033[00m\] ▶️  '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi


## enable color support of ls and also add handy aliases
if [ "$color_prompt" = yes ]; then
	## https://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output/33678?newreg=ead977f7838b41bba240c9e030f4b005
	export CLICOLOR=1
	alias ls='ls -Gp'

	## TODO evaluate
	#export LSCOLORS=ExFxBxDxCxegedabagacad

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

unset color_prompt force_color_prompt


## https://docs.reactioncommerce.com/docs/requirements
## outdated, check with ulimit -l = unlimited
#ulimit -n 65536 65536
