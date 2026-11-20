## user-wide profile for bash(1)
## this config file is usually the first user-level file to be sourced for bash (after /etc/profile, which sources /etc/bashrc)
## https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

## troubleshooting logs: only in interactive shells on a terminal (new tabs/windows + shells typed by hand)
## not in shells launched by tools/scripts (no tty)
## (NOT exported: child processes must stay silent)
[[ $- == *i* && -t 0 && -t 1 ]] && VERBOSE__RC=true
[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bash_profile] hello!" >&2
[ "$VERBOSE__RC" == true ] && [[ $- == *i* ]]      && echo "           ↳ shell is interactive" >&2
[ "$VERBOSE__RC" == true ] && shopt -q login_shell && echo "           ↳ shell is a login shell" >&2  # https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch

export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm

if shopt -q login_shell && [ -f ~/.bash_login ]; then . ~/.bash_login; fi ## call it if login shell since it may be unintentionally shadowed by this file
if [ -f "$PROFILE" ]; then . "$PROFILE"; fi
if [ -f ~/.bashrc  ]; then . ~/.bashrc;  fi ## very common practice, most tools expect this file to be always sourced

