echo "* hello from: .bashrc"

# company security config
shopt -s histappend
export HISTFILESIZE=1048576
export HISTSIZE=1048576
export HISTTIMEFORMAT="%s "
export PROMPT_COMMAND="history -a; history -c; history -r"

source ~/work/src/off/open-source-dev-env/bin/load_shellrc.sh
