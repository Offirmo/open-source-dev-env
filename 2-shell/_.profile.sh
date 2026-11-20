#@IgnoreInspection BashAddShebang
# shellcheck shell=sh

## This file is to maintain common settings without having to update .profile by hand

## shared environment = exported variables only, inherited by every child process (subshells, scripts, tools)
## sourced by ~/.profile (hooked by user--099ensure--cloned--ode_repo.sh)
## - strict POSIX sh: ~/.profile is also read by sh(1) and by some Linux desktop sessions
## - defaults only: a value already set (inherited, or earlier in ~/.profile) wins
## - per-machine/per-person settings -> ~/.profile
## - interactive stuff (aliases, functions, prompt…) + PATH -> shellrc/, sourced by ~/.bashrc + ~/.zshrc
[ "$VERBOSE__RC" = true ] && echo "$(date +%H:%M:%S)     ↳ […ode/…/_.profile.sh] hello!" >&2

## macOS: silences bash's "The default interactive shell is now zsh"
## (it's not too late, bash checks the variable after its startup files)
export BASH_SILENCE_DEPRECATION_WARNING="${BASH_SILENCE_DEPRECATION_WARNING:-1}"

## asks tools to not track https://consoledonottrack.com/
## https://turborepo.com/docs/telemetry#how-do-i-opt-out
export DO_NOT_TRACK="${DO_NOT_TRACK:-1}"

## safety, esp. Ubuntu (https://serverfault.com/a/500778)
export LANG="${LANG:-en_US.UTF-8}"
export LANGUAGE="${LANGUAGE:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

## BSD ls (macOS): colors, equivalent to -G (cf. man ls), only when outputting to a color-capable terminal
## https://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output/33678
## (GNU ls ignores it: colors via the alias in shellrc/_00settings.sh)
export CLICOLOR="${CLICOLOR:-1}"
