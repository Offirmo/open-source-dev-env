#!/usr/bin/env sh
## REM : this file is meant to conveniently complement ~/.bashrc / ~/.zshrc
##       It is supposed to be called in login and non-login shells, after the main rc
##       Usage: source this file (shebang is ignored)
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […ode/…/load_shellrc.sh] hello!"

## useful function
source_bash_files_from_dir() {
    local file
    # ls -1 with 2>/dev/null guards against empty dirs; sort -V handles numeric prefixes
    while IFS= read -r file; do
        [[ -f "$file" ]] && source "$file"
    done < <(ls -1 "$1"/*.sh 2>/dev/null | sort -V)
}

source_bash_files_from_dir "$HOME/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/shellrc"
source_bash_files_from_dir "$HOME/work/bin/shellrc"
