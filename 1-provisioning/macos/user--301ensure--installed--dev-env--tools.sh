#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2026/07"
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

## generic completion utils https://docs.docker.com/engine/cli/completion/#bash
brew install bash-completion

####### CLIs
brew install ast-grep jq yq
#rsync

brew install shellcheck

## GNU version of some utils,
## usually have more options than macOs bundled ones
## ex. relative symlinks with `gln -sr TARGET NEW_SYMLINK`
brew install coreutils


###### terminal
brew install warp

brew install iterm2
# prepare shell integrations, cf. https://iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh



###### git
## Nooo this horror corrupts repos!
#brew install git-lfs

## https://github.com/AGWA/git-crypt/
## 2026/06 not working great + complex to setup
#brew install git-crypt

brew install git-cola git-delta mergiraf




####### IDE
## both those tools have their own update system
## which is redundant with update --greedy but not harmful
brew install jetbrains-toolbox visual-studio-code


####### misc
brew install kdiff3
## TODO find alternative to lepton which is intel
#brew install lepton

## TODO decide which one
brew install responsively
#brew install polypane # polypane is great but paid

## frequently updates, better with brew
#brew install pgadmin4

## recently switched to bruno, free and no cloud https://github.com/usebruno/bruno
#brew install insomnia
brew install bruno


brew install gh
gh config set -h github.com git_protocol https


## https://github.com/semgrep/semgrep https://semgrep.dev/products/community-edition/
## TODO review
brew install semgrep
semgrep --config=auto


## NO!
## Those apps should NOT be installed through brew, too "special"
## virtualbox dropbox docker


#############################################################
echo "* …all done ✅"
