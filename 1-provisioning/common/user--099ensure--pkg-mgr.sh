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
echo "* starting ▶️"

## ensure git is installed
## mainly for macOs, install "Command Line Tools (CLT) for Xcode")
## brings git and some dev tools (cf. https://apple.stackexchange.com/q/321164/214344)
## is a prerequisite for brew, has no prerequisites, should be first.
## This will trigger the install if needed:
git -v > /dev/null
## otherwise directly call "xcode-select --install"


############ Package manager ############
if grep -qi "ubuntu" /etc/os-release; then
	echo "Ubuntu, pkg manager is apt"

	## ensure our machine has correct time
	#sudo apt install -y  ntp

	## basic tools
	sudo apt install -y  vim nano

	## for extensions
	#sudo apt install -y  linux-headers-$(uname -r)
	#sudo apt install -y dkms
elif [[ "$(uname)" == "Darwin" ]]; then
	## install brew, prerequisite for nearly any other tool
	## TODO check https://github.com/justrach/nanobrew
	if command -v brew > /dev/null; then
		echo "* brew is already installed ✅"
	else
		## https://brew.sh/
		## XXX requires sudo, may need to be run manually
		echo "* installing brew ▶️"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	## (XXX deprecated as of 2026) Make brew support multiple versions
	#brew tap homebrew/cask-versions

	echo "* updating brew ▶️"
	brew update
fi

if command -v wget > /dev/null; then
	echo "* wget is already installed ✅"
else
	## for compatibility
	echo "* installing wget ▶️"
	if command -v brew > /dev/null; then
		brew install wget
	elif command -v apt > /dev/null; then
		apt install -y wget
	fi
fi

## needed to verify signatures, ex. mise
if command -v gpg > /dev/null; then
	echo "* gpg is already installed ✅"
else
	## for compatibility
	echo "* installing gpg ▶️"
	if command -v brew > /dev/null; then
		brew install gpg
	elif command -v apt > /dev/null; then
		apt install -y gpg
	fi
fi

## critically needed for ex. here https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
if command -v jq > /dev/null; then
	echo "* jq is already installed ✅"
else
	echo "* installing jq ▶️"
	if command -v brew > /dev/null; then
		brew install jq yq
	elif command -v apt > /dev/null; then
		apt install -y jq yq
	fi
fi

## now that jq was installed (above) we can auto-update GitHub's known host
## ref. https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
echo "Adding/updating GitHub known hosts ▶️"
## remove
ssh-keygen -R github.com
## (re)add
curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >> ~/.ssh/known_hosts


## test if GitHub is connected
## (2026 not needed if cloning with https instead of ssh)
#ssh -T git@github.com || true


## We now have git, we can download this repo and launch scripts locally:
echo "* checking out ODE repo ▶️"
CLONE_DIR=$HOME/work/src/x-external/off/offirmo
mkdir -p $CLONE_DIR
pushd $CLONE_DIR > /dev/null
ODE_INSTALL_DIR=open-source-dev-env
if [[ ! -d $ODE_INSTALL_DIR ]]; then
	## using https to not require a ssh key
	git clone --recursive https://github.com/Offirmo/open-source-dev-env.git
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
