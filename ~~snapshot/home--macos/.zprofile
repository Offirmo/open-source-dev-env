## user-wide profile for zsh(1)
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zprofile] hello!" >&2

export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm
if [ -f ~/.profile ]; then . ~/.profile; fi

