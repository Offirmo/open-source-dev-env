#! /bin/bash
## DEMO of Shell provision script FOR TEST PURPOSE

echo "#########################"
echo "# provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026"
echo "#########################"

## predictable output of tools (english messages, code-point sorting = same on macOS and Linux)
## C.UTF-8 = the only UTF-8 locale available on both (en_US.UTF-8 may not be generated on Linux)
export LANG=C.UTF-8 LC_ALL=C.UTF-8

echo "* environment diagnostic:"
echo "  - bash = $BASH $BASH_VERSION, SHLVL = $SHLVL, stdin = $([ -t 0 ] && echo tty || echo 'not a tty (piped?)')"
echo "  - user = $(whoami) (EUID = $EUID), HOME = $HOME"
echo "  - OS   = $(uname -sm) ($([[ "$OSTYPE" == darwin* ]] && echo "macOS $(sw_vers -productVersion)" || ( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )))"
############################################################
echo "* starting ▶️"

echo "*** hello, $(whoami) ! ***"
echo "This a demo script doing nothing!"
echo "- USER                      = $USER"
echo "- COMPANY                   = $COMPANY"
echo "- COMPANY_DOMAIN            = $COMPANY_DOMAIN"
echo "- COMPANY_USERNAME__GITHUB  = $COMPANY_USERNAME__GITHUB"
echo "- PERSONAL_USERNAME__GITHUB = $PERSONAL_USERNAME__GITHUB"

#############################################################
echo "* …all done ✅"
