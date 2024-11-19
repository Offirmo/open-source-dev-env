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
# deprecated!
#brew tap homebrew/cask-fonts
#brew update

## programming
## https://www.programmingfonts.org/
brew install --cask font-fira-code
#brew install --cask font-jetbrains-mono
#brew install --cask font-iosevka  ## https://github.com/be5invis/Iosevka
## todo nerd fonts? https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/

## UX
brew install --cask font-fira-sans
brew install --cask font-fira-sans-condensed
brew install --cask font-fira-sans-extra-condensed

## design
brew install --cask font-comic-neue


#############################################################
echo "* …all done ✅"
