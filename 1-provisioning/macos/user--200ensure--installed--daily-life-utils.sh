#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2024"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting ▶️"

echo "******* installing base apps through brew…"
if ! command -v wget > /dev/null; then
	echo "* brew is not installed or not loaded! ❌"
fi

## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

brew install --cask sizeup keepassx xnviewmp

# acrobat has its own updater but it runs permanently in the background and I don't trust it
brew install --cask adobe-acrobat-reader

brew install --cask grandperspective

## https://meetingbar.app/
brew install meetingbar

## quick look plugins
## https://github.com/sindresorhus/quick-look-plugins
## TODO check if they are working / worth it
#brew install --cask qlcolorcode qlstephen webpquicklook

#############################################################
echo "* …all done ✅"
