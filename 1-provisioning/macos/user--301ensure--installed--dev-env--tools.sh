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

echo "******* installing base apps through brew…"
## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

## Nooo this horror corrupts repos!
#brew install git-lfs

brew install --cask iterm2
# prepare shell integrations, cf. https://iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

brew install --cask jetbrains-toolbox

brew install --cask kdiff3

brew install git-cola git-delta rsync

brew install --cask visual-studio-code lepton

# TODO decide which one
brew install --cask responsively
#brew install --cask polypane # polypane is great but paid

brew install --cask insomnia

brew install shellcheck

## NO!
## Those apps should NOT be installed through brew:
## virtualbox dropbox

## TODO review
#kern.maxfiles=10485760
#kern.maxfiles: 245760 -> 10485760
#kern.maxfilesperproc=1048576
#kern.maxfilesperproc: 122880 -> 1048576
#kern.maxvnodes=1048576
#kern.maxvnodes: 263168 -> 1048576


#############################################################
echo "* …all done ✅"
