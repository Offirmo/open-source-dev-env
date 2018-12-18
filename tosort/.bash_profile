echo "* hello from: .bash_profile"

if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
