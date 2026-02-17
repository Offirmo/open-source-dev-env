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

## install "Command Line Tools (CLT) for Xcode"
## brings git and some dev tools (cf. https://apple.stackexchange.com/q/321164/214344)
## is a prerequisite for brew, has no prerequisites, should be first.
## This will trigger the install if needed:
git -v > /dev/null
## otherwise directly call "xcode-select --install"


## install brew, prerequisite for nearly any other tool
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if command -v brew > /dev/null; then
	echo "* brew is already installed ✅"
else
	## https://brew.sh/
	echo "* installing brew ▶️"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	## Make brew support multiple versions
	brew tap homebrew/cask-versions
fi

echo "* updating brew ▶️"
brew update

if command -v wget > /dev/null; then
	echo "* wget is already installed ✅"
else
	## for compatibility
	echo "* installing wget ▶️"
	brew install wget
fi

if command -v jq > /dev/null; then
	echo "* jq is already installed ✅"
else
	## needed for ex. here https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
	echo "* installing jq ▶️"
	brew install jq
fi
_
## now that jq was installed (above) we can auto-update GitHub's known host
## ref. https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
echo "Adding/updating GitHub known hosts ▶️"
## remove
ssh-keygen -R github.com
## (re)add
curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >> ~/.ssh/known_hosts
## TODO REVIEW this doesn't seem to fully work

## test if GitHub is connected
#ssh -T git@github.com || true
# TODO FIXME the above line exits the script!

## We now have git, we can download this repo and launch scripts locally:
echo "* checking out ODE repo ▶️"
CLONE_DIR=~/work/src/x-external/off/offirmo
mkdir -p $CLONE_DIR
pushd $CLONE_DIR > /dev/null
ODE_INSTALL_DIR=open-source-dev-env
if [[ ! -d $ODE_INSTALL_DIR ]]; then
    git clone --recursive git@github.com:Offirmo/open-source-dev-env.git
    echo "source $CLONE_DIR/$ODE_INSTALL_DIR/2-shell/bin/load_shellrc.sh" >> ~/.bashrc
else
    cd $ODE_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null

echo "* ODE repo cloned, please execute the provisioning scripts locally:"
ls -l $CLONE_DIR/$ODE_INSTALL_DIR/1-provisioning/common/
ls -l $CLONE_DIR/$ODE_INSTALL_DIR/1-provisioning/macos/

#############################################################
echo "* …all done ✅"
