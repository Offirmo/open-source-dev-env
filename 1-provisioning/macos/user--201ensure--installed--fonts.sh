#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026/07"
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
############################################################
echo "* starting…"

echo "******* installing some fonts through brew…"
### Allow fonts  https://github.com/Homebrew/homebrew-cask-fonts
# deprecated!
#brew tap homebrew/cask-fonts
#brew update

## programming
## https://www.programmingfonts.org/

## good, useful to enable it in non-JetBrains ex. terminal or git-cola
brew install font-jetbrains-mono

## excellent coding font, still better than JetBrains IMO
brew install font-fira-code

## TODO review
#brew install font-iosevka  ## https://github.com/be5invis/Iosevka

## TODO review: nerd fonts? https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/

## UX
brew install font-fira-sans
brew install font-fira-sans-condensed
brew install font-fira-sans-extra-condensed ## somehow doesn't work in Webstorm settings selector

## design
# TODO review, causes problems when upgrade greedy
#brew install font-comic-neue


#############################################################
echo "* …all done ✅"
