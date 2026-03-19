#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2026"
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
## TODO review https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
## TODO review https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage

############ global gitignore
## https://gist.github.com/subfuzion/db7f57fff2fb6998a16c
if [ -f ~/.config/git/ignore ]; then
	echo "* ~/.config/git/ignore already exists ✅"
else
	echo "* creating ~/.config/git/ignore ▶️"
	touch ~/.config/git/ignore
fi
if ! grep -qF '.DS_Store' ~/.config/git/ignore; then
  echo '.DS_Store' >> ~/.config/git/ignore
fi

############ global gitattributes
if [ -f ~/.config/git/attributes ]; then
	echo "* ~/.config/git/attributes already exists ✅"
else
	echo "* creating ~/.config/git/attributes ▶️"
	touch ~/.config/git/attributes
fi

############ global config
git config --global push.default simple
git config --global color.ui "auto"



## "This default branch name will change to "main" in Git 3.0"
## but macOs is lagging
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
git config --global merge.mergiraf.driver 'mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L'
if ! grep -qF '* merge=mergiraf' ~/.config/git/attributes; then
  echo '* merge=mergiraf' >> ~/.config/git/attributes
fi
## TODO evaluate https://github.com/jelmer/awesome-merge-drivers?tab=readme-ov-file#all-in-one-merge-drivers

## ??
#git config --global diff.colorMoved "default"

echo "* git global config set ✅"


############ Offirmo shared scripts ############



############ misc ############
echo "* downloading some stuff…"

## solarized color scheme
## TODO REVIEW
## https://github.com/altercation/solarized
## https://ethanschoonover.com/solarized
#pushd ~/work/install > /dev/null
#SOLARIZED_INSTALL_DIR=solarized
#if [[ ! -d ~/work/install/$SOLARIZED_INSTALL_DIR ]]; then
#    git clone --recursive https://github.com/altercation/solarized.git $SOLARIZED_INSTALL_DIR
#else
#    cd $SOLARIZED_INSTALL_DIR
#    git fetch
#    git pull
#fi
#popd > /dev/null
#echo "* solarized color scheme downloaded and up-to-date ✅"

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



## Offline doc TODO review
## devdocs
#git clone https://github.com/Thibaut/devdocs.git && cd devdocs
## reactive extensions
## CSS

echo "* …all done ✅"
