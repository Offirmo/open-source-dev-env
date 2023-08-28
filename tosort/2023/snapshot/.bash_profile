echo "* hello from: .bash_profile"

export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
