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


############ Git ############
git config --global push.default simple
git config --global color.ui "auto"

## global gitignore
## https://gist.github.com/subfuzion/db7f57fff2fb6998a16c
if [ ! -f ~/.gitignore ]; then
	echo "" > ~/.gitignore
	echo ".DS_Store" >> ~/.gitignore
fi
git config --global core.excludesfile ~/.gitignore

## from https://github.com/dandavison/delta/blob/master/README.md
git config --global core.pager "delta --syntax-theme='Solarized (light)'"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.merge "conflictstyle = diff3"
git config --global delta.side-by-side true
git config --global diff.colorMoved "default"
## from https://stackoverflow.com/questions/18308535/automatic-prune-with-git-fetch-or-pull/40842589#40842589
# Enable automatic pruning for all your repos
git config --global fetch.prune true
git config --global fetch.pruneTags true
# Enable if you use a git GUI
git config --global gui.pruneDuringFetch true


############ Offirmo shared scripts ############



############ misc ############
echo "* downloading some stuff…"

## solarized color scheme
## TODO REVIEW
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

## jetbrains solarized color scheme (better than the above)
## https://github.com/jkaving/intellij-colors-solarized
pushd ~/work/install > /dev/null
JETBRAINS_SOLARIZED_INSTALL_DIR=intellij-colors-solarized
if [[ ! -d ~/work/install/$JETBRAINS_SOLARIZED_INSTALL_DIR ]]; then
    git clone --recursive https://github.com/jkaving/intellij-colors-solarized.git $JETBRAINS_SOLARIZED_INSTALL_DIR
else
    cd $JETBRAINS_SOLARIZED_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null



## Offline doc TODO
## devdocs
#git clone https://github.com/Thibaut/devdocs.git && cd devdocs
## reactive extensions
## CSS

echo "* …all done ✅"
