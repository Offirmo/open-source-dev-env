#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026/11"
echo "#########################"

if [ "$EUID" -eq 0 ]; then
	echo "* should NOT be run as root ❌"
	exit 1
fi

## predictable output of tools (english messages, code-point sorting = same on macOS and Linux)
## C.UTF-8 = the only UTF-8 locale available on both (en_US.UTF-8 may not be generated on Linux)
export LANG=C.UTF-8 LC_ALL=C.UTF-8

echo "* environment diagnostic:"
echo "  - bash = $BASH $BASH_VERSION, SHLVL = $SHLVL, stdin = $([ -t 0 ] && echo tty || echo 'not a tty (piped?)')"
echo "  - user = $(whoami), HOME = $HOME"
echo "  - OS   = $(uname -sm) ($([[ "$OSTYPE" == darwin* ]] && echo "macOS $(sw_vers -productVersion)" || ( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )))"
############################################################
## shared
ensure_file_has_line() {
  local file="$1"
  local line="$2"
  local mode="${3:-append}"  # append | prepend

  [[ ! -f "$file" ]] && printf '%s\n' "$line" > "$file" && return 0

  file_has_line "$file" "$line" && return 0

  if [[ "$mode" == "prepend" ]]; then
    local tmp
    tmp=$(mktemp)
    { printf '%s\n' "$line"; cat "$file"; } > "$tmp" && mv "$tmp" "$file"
  else
    printf '\n%s\n' "$line" >> "$file"
  fi
}

file_has_line() {
  local file="$1"
  local line="$2"
  grep --quiet --line-regexp --fixed-strings "$line" "$file"
}

## for lines written into config files: portable across machines/usernames
shorten_home_path() {
  local full_path="$1"
  case "$full_path" in
    "$HOME")   printf '%s\n' '~' ;;
    "$HOME"/*) printf '%s\n' "~${full_path#"$HOME"}" ;;
    *)         printf '%s\n' "$full_path" ;;
  esac
}

############################################################
echo "* starting ▶️"

## git is ensured by user--050ensure--pkg-mgr.sh
## (on macOS, this also triggers the install of the Xcode Command Line Tools if missing)
if ! git --version > /dev/null; then
	echo "* git is not available, please run user--050ensure--pkg-mgr.sh first ❌"
	exit 1
fi

## We now have git, we can download this repo and launch scripts locally:
echo "* checking out ODE repo ▶️"
CLONE_DIR=$HOME/work/src/x-external/off/offirmo
ODE_INSTALL_DIR=open-source-dev-env
mkdir -p "$CLONE_DIR"
pushd "$CLONE_DIR" > /dev/null
if [[ ! -d $ODE_INSTALL_DIR ]]; then
	## using https to not require a ssh key
	git clone --recursive https://github.com/Offirmo/open-source-dev-env.git "$ODE_INSTALL_DIR"
else
	cd "$ODE_INSTALL_DIR"
	git fetch
	git pull
fi
popd > /dev/null

## outsource common settings outside of .profile to this repo for easier upgrades
## ~/.profile is also read by sh(1) -> POSIX "." instead of "source"
## guarded: "." on a missing file aborts a non-interactive sh (ex. a Linux desktop session script) = failed login
ODE_PROFILE_PATH="$(shorten_home_path "$CLONE_DIR/$ODE_INSTALL_DIR/2-shell/_.profile.sh")"
LOAD_PROFILE_LINE="if [ -f $ODE_PROFILE_PATH ]; then . $ODE_PROFILE_PATH; fi"
ensure_file_has_line ~/.profile "$LOAD_PROFILE_LINE"
echo "* ~/.profile loads the ODE profile ✅"

## wire our complex inits from this repo
LOAD_SHELLRC_LINE="source $(shorten_home_path "$CLONE_DIR/$ODE_INSTALL_DIR/2-shell/bin/load_shellrc.sh")"
ensure_file_has_line ~/.bashrc "$LOAD_SHELLRC_LINE"
ensure_file_has_line ~/.zshrc  "$LOAD_SHELLRC_LINE"
echo "* ~/.bashrc + ~/.zshrc load the ODE shellrc ✅"

echo "* ODE repo cloned, please execute the provisioning scripts locally:"
ls -l "$CLONE_DIR/$ODE_INSTALL_DIR/1-provisioning/common/"
ls -l "$CLONE_DIR/$ODE_INSTALL_DIR/1-provisioning/macos/"

#############################################################
echo "* …all done ✅"
