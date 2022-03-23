echo "* hello from: …open-source-dev-env/shellrc/settings.sh"

## remove duplicated bash history https://askubuntu.com/a/15929
export HISTCONTROL=ignoreboth:erasedups

## prevents installing libs without an active virtualenv
## https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
export PIP_REQUIRE_VIRTUALENV=true

## set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
	## with user + machine (not very useful if always the same)
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='™\[\033[01;34m\]\w\[\033[00m\] —► '
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
## seems outdated anyway, check with ulimit -l
#ulimit -n 65536 65536

## enable brew autocomplete
if command -v brew &> /dev/null
then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi
