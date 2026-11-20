#@IgnoreInspection BashAddShebang
[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/00-init.sh] hello!" >&2

## used by some scripts to check a commit doesn't contain local/confidential data
export FORBIDDEN_KEYWORDS="
  $USER
"
