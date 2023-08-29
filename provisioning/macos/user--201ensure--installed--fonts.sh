#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2023"
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
echo "* starting…"

echo "******* installing some fonts through brew…"
### Allow fonts  https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts
brew update

## https://github.com/be5invis/Iosevka
#brew install --cask font-iosevka
brew install --cask font-comic-neue
brew install --cask font-fira-code
brew install --cask font-fira-sans
brew install --cask font-fira-sans-condensed
brew install --cask font-fira-sans-extra-condensed

#############################################################
echo "* …all done ✅"
