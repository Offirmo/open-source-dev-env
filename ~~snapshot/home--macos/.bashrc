## user-wide runtime configuration for bash(1)
## in theory it’s non-login only but in practice everyone expect it to be always sourced
## https://apple.stackexchange.com/a/13019/214344

## troubleshooting logs: same as in ~/.bash_profile, repeated bc a non-login bash (ex. `bash` typed from zsh) only reads this file
[[ $- == *i* && -t 0 && -t 1 ]] && VERBOSE__RC=true
[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bashrc] hello!" >&2


source ~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/load_shellrc.sh
