#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2024"
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
echo "* starting…"

## WARNING this assumes that ssh config was altered for offirmo / dual ssh key
## Offirmo
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/open-source-dev-env.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/minisite-bookmarks-ghpages.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/offirmo-monorepo.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/web-tech-experiments.git
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/offirmo.github.io.git
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/my.dev.to.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/sync-local-repos.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/blog.git
~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo/x.git

## Offirmo team
## git@offirmo.github.com:Offirmo-team
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:Offirmo-team/wiki.git

## Offirmo's Online Adventures
## git@offirmo.github.com:online-adventures
#~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin/gitc.sh  git@offirmo.github.com:online-adventures/online-adventures.github.io.git

#############################################################
echo "* …all done ✅"
