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
echo "  - XDG_CONFIG_HOME = ${XDG_CONFIG_HOME:-(unset)}"
############################################################
## XDG base dirs = the spec defaults when unset or empty
## https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
## NOT exported: no change for child processes (some tools behave differently when set, ex. nvm's installer)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

############################################################
echo "* starting…"



############ Git ############
## TODO review https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
## TODO review https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage

############ global gitignore
## https://gist.github.com/subfuzion/db7f57fff2fb6998a16c
## [Claude] default fallback location for global excludes, used automatically, no command needed, as long as core.excludesfile isn't explicitly set to something else
if [ -f "$XDG_CONFIG_HOME/git/ignore" ]; then
	echo "* $XDG_CONFIG_HOME/git/ignore already exists ✅"
else
	echo "* creating $XDG_CONFIG_HOME/git/ignore ▶️"
	mkdir -p "$XDG_CONFIG_HOME/git"
	touch    "$XDG_CONFIG_HOME/git/ignore"
fi
if ! grep --quiet --fixed-strings '.DS_Store' "$XDG_CONFIG_HOME/git/ignore"; then
  echo '.DS_Store' >> "$XDG_CONFIG_HOME/git/ignore"
fi
## Also seen: *.swp core

############ global gitattributes
if [ -f "$XDG_CONFIG_HOME/git/attributes" ]; then
	echo "* $XDG_CONFIG_HOME/git/attributes already exists ✅"
else
	echo "* creating $XDG_CONFIG_HOME/git/attributes ▶️"
	mkdir -p "$XDG_CONFIG_HOME/git"
	touch    "$XDG_CONFIG_HOME/git/attributes"
fi

############ global config
## git reads both ~/.gitconfig and $XDG_CONFIG_HOME/git/config
## but `git config --global` only writes into the XDG one if it exists AND ~/.gitconfig doesn't
## https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
## -> on a fresh machine, create it so that the global config lands in the XDG dir
## (an existing ~/.gitconfig is left alone = keeps receiving the writes)
if [ ! -f ~/.gitconfig ] && [ ! -f "$XDG_CONFIG_HOME/git/config" ]; then
	echo "* creating $XDG_CONFIG_HOME/git/config ▶️"
	mkdir -p "$XDG_CONFIG_HOME/git"
	touch    "$XDG_CONFIG_HOME/git/config"
fi

git config --global push.default simple
git config --global color.ui "auto"

## declare merge=ours as a merge driver
## https://7tonshark.com/posts/avoid-conflicts-in-pnpm-lock/
git config --global merge.ours.name "keep ours"
git config --global merge.ours.driver true


## "This default branch name will change to "main" in Git 3.0"
## but macOs is lagging (still 2.54 as of 2026/09)
git config --global init.defaultBranch main

## from https://stackoverflow.com/questions/18308535/automatic-prune-with-git-fetch-or-pull/40842589#40842589
# Enable automatic pruning for all your repos
git config --global fetch.prune true
git config --global fetch.pruneTags true
# Enable if you use a git GUI
git config --global gui.pruneDuringFetch true

####### git-delta
## from https://github.com/dandavison/delta/blob/master/README.md
## also https://dandavison.github.io/delta/configuration.html
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
#	syntax-theme = gruvbox-dark
#git config --global delta.navigate true
#git config --global delta.dark true  # or `delta.light true`, or omit for auto-detection
git config --global merge.conflictStyle zdiff3
## additions
#it config --global core.pager "delta --syntax-theme='Solarized (light)'"
git config --global delta.side-by-side true
git config --global delta.line-numbers true

####### mergiraf
## https://mergiraf.org/usage.html#registration-as-a-git-merge-driver
git config --global merge.mergiraf.name mergiraf
git config --global merge.mergiraf.driver 'mergiraf merge --git %O %A %B --base-name %S --left-name %X --right-name %Y --path-name %P --conflict-marker-size %L'
if ! grep --quiet --fixed-strings '* merge=mergiraf' "$XDG_CONFIG_HOME/git/attributes"; then
  echo '* merge=mergiraf' >> "$XDG_CONFIG_HOME/git/attributes"
fi
## TODO evaluate https://github.com/jelmer/awesome-merge-drivers?tab=readme-ov-file#all-in-one-merge-drivers

## ??
#git config --global diff.colorMoved "default"

echo "* git global config set ✅"


############ Offirmo shared scripts ############



############ misc ############
echo "* downloading some stuff…"

## solarized color scheme
## Useful for iTerm whose solarized mode is not great (grey dim colors)
## https://github.com/altercation/solarized
## https://ethanschoonover.com/solarized
pushd ~/work/install > /dev/null
SOLARIZED_INSTALL_DIR=solarized
if [[ ! -d ~/work/install/$SOLARIZED_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/altercation/solarized.git $SOLARIZED_INSTALL_DIR
else
    cd $SOLARIZED_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null
echo "* solarized color scheme downloaded and up-to-date ✅"

## jetbrains solarized color scheme (better than the above)
## https://github.com/jkaving/intellij-colors-solarized
#pushd ~/work/install > /dev/null
#JETBRAINS_SOLARIZED_INSTALL_DIR=intellij-colors-solarized
#if [[ ! -d ~/work/install/$JETBRAINS_SOLARIZED_INSTALL_DIR ]]; then
#    git clone --recursive https://github.com/jkaving/intellij-colors-solarized.git $JETBRAINS_SOLARIZED_INSTALL_DIR
#else
#    cd $JETBRAINS_SOLARIZED_INSTALL_DIR
#    git fetch
#    git pull
#fi
#popd > /dev/null
#echo "* jetbrains solarized color scheme downloaded and up-to-date ✅"


## for status bar
## works across all shells ✅
brew install --cask font-fira-code-nerd-font
echo "Fira Code nerd installed ✅ Please enable it in your terminal"
brew install starship


## Offline doc TODO review
## devdocs
#git clone https://github.com/Thibaut/devdocs.git && cd devdocs
## reactive extensions
## CSS

echo "* …all done ✅"
