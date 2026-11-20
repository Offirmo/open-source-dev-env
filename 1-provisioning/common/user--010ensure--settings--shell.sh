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
echo "  - login SHELL = $SHELL"
echo "  - COMPANY = ${COMPANY:-(unset)}, COMPANY_DOMAIN = ${COMPANY_DOMAIN:-(unset)}"
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

############################################################
echo "* starting ▶️"

## good reads
# https://www.baeldung.com/linux/rc-files#rc-configuration-files


####### profiles ########
## https://docs.google.com/spreadsheets/d/1VC5DRHw-ResS5LgoTA131ORXCv9s_aNGuhUNOEeA1-c/edit?gid=495591543#gid=495591543

## common
## POSIX = /etc/profile -> ~/.profile
if [ -f ~/.profile ]; then
	echo "* ~/.profile already exists ✅"
else
	echo "* creating a runtime config file: ~/.profile ▶️"
	## IMPORTANT
	## this is not re-sourced when launching a sub-shell
	## so ensure his only gets export FOO=BAR
	## since those are inherited.
	{
		echo '## user-wide profile for sh(1)'
		echo '## may (should) also be sourced by other shells'
		echo '[ "$VERBOSE__RC" = true ] && echo "$(date +%H:%M:%S)   ↳ [~/.profile] hello!" >&2'
		echo
		## Reminder: we don't declare XDG variables because every script using them is supposed to use defaults if they don't exist
		echo '## Customizations = this machine/person only'
		## don't advertise this one
		##echo '#export IS_OFFIRMO_DEV_ENV=1  ## Offirmo only: dedicated ssh key, private APIs and tools, no telemetry on own apps'
		echo '#export PERSONAL_USERNAME__GITHUB=Foo'
		echo '#export COMPANY="foo"'
		echo '#export COMPANY_DOMAIN="$COMPANY.com"'
		echo '#export COMPANY_USERNAME__GITHUB="xxx-$COMPANY"'
		echo '#export COMPANY_ORG1__GITHUB="$COMPANY"'
		echo '#export COMPANY_ORG2__GITHUB="$COMPANY-alt"'
		echo
		echo '## (shared defaults = ODE 2-shell/_.profile.sh, will be sourced below once the ODE repo is cloned)'
		## brew pre-6 (legacy)
		#echo 'export HOMEBREW_REQUIRE_TAP_TRUST=1'
	} >> ~/.profile
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.profile '[ "$VERBOSE__RC" = true ] && echo "$(date +%H:%M:%S)   ↳ [~/.profile] hello!" >&2' prepend

####### bash #######
## interactive login    : /etc/profile -> ~/.bash_profile OR ~/.bash_login OR ~/.profile
## interactive non login: ~/.bashrc
if [ -f ~/.bash_profile ]; then
	echo "* ~/.bash_profile already exists ✅"
else
	## do NOT put anything not specific to login here
	echo "* creating a runtime config file: ~/.bash_profile ▶️"
	{
		echo '## user-wide profile for bash(1)'
		echo '## this config file is usually the first user-level file to be sourced for bash (after /etc/profile, which sources /etc/bashrc)'
		echo '## https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html'
		echo
		echo '## troubleshooting logs: only in interactive shells on a terminal (new tabs/windows + shells typed by hand)'
		echo '## not in shells launched by tools/scripts (no tty)'
		echo '## (NOT exported: child processes must stay silent)'
		echo '[[ $- == *i* && -t 0 && -t 1 ]] && VERBOSE__RC=true'
		echo '[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bash_profile] hello!" >&2'
		echo '[ "$VERBOSE__RC" == true ] && [[ $- == *i* ]]      && echo "           ↳ shell is interactive" >&2'
		echo '[ "$VERBOSE__RC" == true ] && shopt -q login_shell && echo "           ↳ shell is a login shell" >&2  # https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch'
		echo
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo
		echo 'if shopt -q login_shell && [ -f ~/.bash_login ]; then . ~/.bash_login; fi ## call it if login shell since it may be unintentionally shadowed by this file'
		echo 'if [ -f "$PROFILE" ]; then . "$PROFILE"; fi'
		echo 'if [ -f ~/.bashrc  ]; then . ~/.bashrc;  fi ## very common practice, most tools expect this file to be always sourced'
		echo
	} >> ~/.bash_profile
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.bash_profile '[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bash_profile] hello!" >&2' prepend

if [ -f ~/.bashrc ]; then
	echo "* ~/.bashrc already exists ✅"
else
	echo "* creating a runtime config file: ~/.bashrc ▶️"
	{
		echo '## user-wide runtime configuration for bash(1)'
		echo '## in theory it’s non-login only but in practice everyone expect it to be always sourced'
		echo '## https://apple.stackexchange.com/a/13019/214344'
		echo
		echo '## troubleshooting logs: same as in ~/.bash_profile, repeated bc a non-login bash (ex. `bash` typed from zsh) only reads this file'
		echo '[[ $- == *i* && -t 0 && -t 1 ]] && VERBOSE__RC=true'
		echo '[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bashrc] hello!" >&2'
		echo
	} >> ~/.bashrc
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.bashrc '[ "$VERBOSE__RC" == true ] && echo "$(date +%H:%M:%S) ↳ [~/.bashrc] hello!" >&2' prepend


####### zsh #######
## /etc/zshenv -> ~/.zshenv -> /etc/zprofile -> ~/.zprofile -> /etc/zshrc -> ~/.zshrc -> /etc/zlogin -> ~/.zlogin
if [ -f ~/.zshenv ]; then
	echo "* ~/.zshenv already exists ✅"
else
	echo "* creating a runtime config file: ~/.zshenv ▶️"
	{
		echo '## user-wide configuration for zsh(1)'
		echo '## sourced by EVERY zsh (incl. scripts) -> must stay fast and silent'
		echo '## order: /etc/zshenv -> ~/.zshenv -> /etc/zprofile -> ~/.zprofile -> /etc/zshrc -> ~/.zshrc -> /etc/zlogin -> ~/.zlogin'
		echo '## https://zsh.sourceforge.io/Guide/zshguide02.html'
		echo
		echo '## troubleshooting logs: only in interactive shells on a terminal (new tabs/windows + shells typed by hand)'
		echo '## not in shells launched by tools/scripts (no tty)'
		echo '## (NOT exported: child processes must stay silent)'
		echo '[[ -o interactive && -t 0 && -t 1 ]] && VERBOSE__RC=true'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zshenv] hello!" >&2'
		echo
		echo '## auto-dedupe PATH, keeping the 1st occurrence'
		echo '## - why: startup files (brew shellenv, Docker, mise…) prepend unconditionally, and every nested shell (Claude Code, tmux, IDE terminals) inherits PATH and re-runs them -> duplicates'
		echo '##   (harmless for lookup since 1st match wins, but noisy `type -a` and slower lookups of missing commands)'
		echo '## - why here: the only file read by EVERY zsh, incl. non-interactive ones (scripts, `zsh -c`, tools) which never source ~/.zshrc'
		echo '## - why not a zsh default: sh/ksh compat + it changes semantics: re-prepending an entry moves it to the front (good) but re-appending one is a no-op (can no longer move it to the end)'
		echo '## - both PATH and path: -U on `path` alone does NOT dedupe "PATH=..." assignments (used by brew, mise…)'
		echo '## https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html (typeset -U)'
		echo 'typeset -U PATH path'
		echo
	} >> ~/.zshenv
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.zshenv '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zshenv] hello!" >&2' prepend
ensure_file_has_line ~/.zshenv 'typeset -U PATH path' append

if [ -f ~/.zprofile ]; then
	echo "* ~/.zprofile already exists ✅"
else
	echo "* creating a runtime config file: ~/.zprofile ▶️"
	{
		echo '## user-wide profile for zsh(1)'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zprofile] hello!" >&2'
		echo
		echo 'export PROFILE=~/.profile  ## helps some tools to locate the intended profile, ex. nvm'
		echo 'if [ -f ~/.profile ]; then . ~/.profile; fi'
		echo
	} >> ~/.zprofile
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.zprofile '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zprofile] hello!" >&2' prepend

if [ -f ~/.zshrc ]; then
	echo "* ~/.zshrc already exists ✅"
else
	echo "* creating a runtime config file: ~/.zshrc ▶️"
	{
		echo '## user-wide runtime configuration for zsh(1)'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zshrc] hello!" >&2'
		echo
	} >> ~/.zshrc
fi
## ensure some critical lines are always present
ensure_file_has_line ~/.zshrc '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ [~/.zshrc] hello!" >&2' prepend


####### bin #######

if [[ -n "$COMPANY" ]]; then
	TARGET=$HOME/work/bin/git--$COMPANY.sh
	if [ -f $TARGET ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		{
			echo '#! /bin/bash'
			echo "git config user.email     \"$USER@$COMPANY_DOMAIN\""
			echo "git config user.name      \"$USER\""
			echo
			echo "npm set init-author-email \"$USER@$COMPANY_DOMAIN\""
			echo "npm set init-author-name  \"$USER\""
			echo
		} >> $TARGET
	fi
	chmod +x "$TARGET"

	## sourced by both bash and zsh -> no shebang
	TARGET=$HOME/work/bin/shellrc/alias--$COMPANY.sh
	if [ -f $TARGET ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		{
			echo '#@IgnoreInspection BashAddShebang'
			echo
		} >> $TARGET
	fi
else
	echo "* reminder to set \$COMPANY"
fi;


TARGET=$HOME/work/bin/shellrc/00-init.sh
if [ -f $TARGET ]; then
	echo "* $TARGET already exists ✅"
else
	echo "* creating $TARGET ▶️"
	{
		echo '#@IgnoreInspection BashAddShebang'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/00-init.sh] hello!" >&2'
		echo
		echo "## used by some scripts to check a commit doesn't contain local/confidential data"
		echo 'export FORBIDDEN_KEYWORDS="'
		echo '  $USER'
		echo '"'
	} >> $TARGET
fi
ensure_file_has_line $TARGET '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/00-init.sh] hello!" >&2' prepend


echo "* PLEASE RESTART YOUR TERMINAL! ⚠️⚠️⚠️"
#############################################################
echo "* …all done ✅"
