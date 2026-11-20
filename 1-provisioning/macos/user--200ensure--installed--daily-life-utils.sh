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
echo "  - brew = $(command -v brew || echo '(not found)')"
echo "  - COMPANY = ${COMPANY:-(unset)}, COMPANY_DOMAIN = ${COMPANY_DOMAIN:-(unset)}"
############################################################
echo "* starting ▶️"

echo "******* installing base apps through brew…"
if ! command -v brew > /dev/null; then
	echo "* brew is not installed or not loaded! ❌"
fi

## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

brew install rectangle xnviewmp

## acrobat has its own updater but it runs permanently in the background and I don't trust it
## (to review. less and less useful + install crap)
#brew install adobe-acrobat-reader

brew install grandperspective

## https://meetingbar.app/
if [ -n "$COMPANY" ]; then
	brew install meetingbar
fi

## quick look plugins
## https://github.com/sindresorhus/quick-look-plugins
## TODO check if they are working / worth it
#brew install qlcolorcode qlstephen webpquicklook

#############################################################
echo "* …all done ✅"
