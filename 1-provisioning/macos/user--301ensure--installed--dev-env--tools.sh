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
echo "  - brew = $(command -v brew || echo '(not found)')"
############################################################
echo "* starting…"

echo "******* installing base apps through brew…"
## base apps: https://github.com/Homebrew/homebrew-cask/search?q=visual&unscoped_q=visual
## in order of importance, to allow ctrl+C

## more modern bash
## As of 2026/11 default = ^3, brew = ^5
## https://smallsharpsoftwaretools.com/tutorials/use_modern_bash_on_macos/
## NOTE not default, need to run with $(brew --prefix)/bin/bash
brew install bash

## generic completion utils https://docs.docker.com/engine/cli/completion/#bash
brew install bash-completion

####### CLIs
## https://formulae.brew.sh/formula/fd (was requested by Claude)
brew install ast-grep jq yq fd
#rsync

brew install shellcheck

## GNU version of some utils,
## usually have more options than macOs bundled ones
## ex. relative symlinks with `gln -sr TARGET NEW_SYMLINK`
brew install coreutils


###### terminal
brew install warp

brew install iterm2
## shell integration https://iterm2.com/documentation-shell-integration.html
## NOT downloaded here: done on demand at the 1st iTerm shell by 2-shell/shellrc/_sub_tools.sh,
## then refreshed by 2-shell/bin/user--update.sh



###### git
## install the git-lfs client in case some repos need it
brew install git-lfs
## user-wide setup (~/.gitconfig), actual usage is from .gitattributes per-repo
## --skip-repo = do NOT also install LFS hooks into the repo we accidentally may happen to be in (ex. this one)
git lfs install --skip-repo

## https://github.com/AGWA/git-crypt/
## 2026/06 not working great + complex to setup
#brew install git-crypt

brew install git-cola

## https://github.com/dandavison/delta
## https://mergiraf.org/
## https://difftastic.wilfred.me.uk/
brew install git-delta mergiraf difftastic
## TODO be very careful to not enable difftastic by default to not disorient LLMs
## ex. no "external = difft"
## TODO mergiraf needs post-install
## $XDG_CONFIG_HOME/git/attributes   merge=mergiraf
## or more targeted   mergiraf languages --gitattributes (not really needed, mergiraf is clever)
## TODO difftastic needs post-install
## https://difftastic.wilfred.me.uk/git.html#difftastic-by-default

## for working with GitHub
brew install gh
## TODO review may help bypass ssh restrictions, not standard
gh config set --host github.com git_protocol https
## TODO review extensions
gh extension install github/gh-stack


####### IDE
## both those tools have their own update system
## which is redundant with update --greedy but not harmful
brew install jetbrains-toolbox visual-studio-code


####### misc
brew install kdiff3

## auto package manager
## https://github.com/antfu-collective/ni
## better installed through brew than mise, or can't delete pnpm cache
brew install ni


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





## https://github.com/semgrep/semgrep https://semgrep.dev/products/community-edition/
## TODO review
#brew install semgrep
#semgrep --config=auto


## NO!
## Those apps should NOT be installed through brew, too "special"
## virtualbox dropbox docker


#############################################################
echo "* …all done ✅"
