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
echo "* starting ▶️"

## install "Command Line Tools (CLT) for Xcode"
## brings git and some dev tools (cf. https://apple.stackexchange.com/q/321164/214344)
## is a prerequisite for brew, has no prerequisites, should be first.
## This will trigger the install if needed:
git -v > /dev/null
## otherwise directly call "xcode-select --install"


## install brew, prerequisite for nearly any other tool
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if ! command -v brew > /dev/null; then
	## https://docs.brew.sh/Installation
	echo "* installing brew ▶️"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	## Make brew support multiple versions
	brew tap homebrew/cask-versions
fi

echo "* updating brew ▶️"
brew update

if ! command -v jq > /dev/null; then
	## needed for ex. here https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
	brew install jq
fi

## now that jq was installed (above) we can auto-update GitHub's known host
## ref. https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
ssh-keygen -R github.com
curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >> ~/.ssh/known_hosts

## test if GitHub is connected
ssh -T git@github.com || true

## We now have git, we can download this repo and launch scripts locally:
echo "* checkout ODE repo…"
mkdir -p ~/work/src/off
pushd ~/work/src/off > /dev/null
ODE_INSTALL_DIR=open-source-dev-env
if [[ ! -d $ODE_INSTALL_DIR ]]; then
    git clone --recursive git@github.com:Offirmo/open-source-dev-env.git
    echo "source ~/work/src/off/open-source-dev-env/bin/load_shellrc.sh" >> ~/.bashrc
else
    cd $ODE_INSTALL_DIR
    git fetch
    git pull
fi
popd > /dev/null

echo "* ODE repo cloned, please execute the provisioning scripts locally:"
ls -l ~/work/src/off/open-source-dev-env/provisioning/common/
ls -l ~/work/src/off/open-source-dev-env/provisioning/macos/

#############################################################
echo "* …all done ✅"
