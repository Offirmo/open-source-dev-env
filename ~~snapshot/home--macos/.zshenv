## user-wide configuration for zsh(1)
## sourced by EVERY zsh (incl. scripts) -> must stay fast and silent
## order: /etc/zshenv -> ~/.zshenv -> /etc/zprofile -> ~/.zprofile -> /etc/zshrc -> ~/.zshrc -> /etc/zlogin -> ~/.zlogin
## https://zsh.sourceforge.io/Guide/zshguide02.html

## troubleshooting logs: only in interactive shells on a terminal (new tabs/windows + shells typed by hand)
## not in shells launched by tools/scripts (no tty)
## (NOT exported: child processes must stay silent)
[[ -o interactive && -t 0 && -t 1 ]] && VERBOSE__RC=true
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zshenv] hello!" >&2

## auto-dedupe PATH, keeping the 1st occurrence
## - why: startup files (brew shellenv, Docker, mise…) prepend unconditionally, and every nested shell (Claude Code, tmux, IDE terminals) inherits PATH and re-runs them -> duplicates
##   (harmless for lookup since 1st match wins, but noisy `type -a` and slower lookups of missing commands)
## - why here: the only file read by EVERY zsh, incl. non-interactive ones (scripts, `zsh -c`, tools) which never source ~/.zshrc
## - why not a zsh default: sh/ksh compat + it changes semantics: re-prepending an entry moves it to the front (good) but re-appending one is a no-op (can no longer move it to the end)
## - both PATH and path: -U on `path` alone does NOT dedupe "PATH=..." assignments (used by brew, mise…)
## https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html (typeset -U)
typeset -U PATH path

