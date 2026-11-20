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
echo "  - admin group = $(id -Gn | grep --quiet --word-regexp --extended-regexp 'admin|sudo|wheel' && echo yes || echo no)"
############################################################
echo "* starting ▶️"

## ensure git is installed
## mainly for macOs, install "Command Line Tools (CLT) for Xcode")
## brings git and some dev tools (cf. https://apple.stackexchange.com/q/321164/214344)
## is a prerequisite for brew, has no prerequisites, should be first.
## This will trigger the install if needed:
git --version > /dev/null
## otherwise directly call "xcode-select --install"


############ Package manager ############
if [ -f /etc/os-release ] && grep --quiet --ignore-case "ubuntu" /etc/os-release; then
	echo "Ubuntu, pkg manager is apt"

	## TODO brew can be used on linux, review!

	## ensure our machine has correct time
	#sudo apt install --yes  ntp

	## basic tools
	sudo apt install --yes  vim nano

	## for extensions
	#sudo apt install --yes  linux-headers-$(uname --kernel-release)
	#sudo apt install --yes dkms
elif [[ "$(uname)" == "Darwin" ]]; then
	## install brew, prerequisite for nearly any other tool
	## TODO check https://github.com/justrach/nanobrew
	if command -v brew > /dev/null; then
		echo "* brew is already installed ✅"
	else
		## https://brew.sh/
		## XXX requires sudo, may need to be run manually
		echo "* installing brew ▶️"
		/bin/bash -c "$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
		apt install --yes wget
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
		apt install --yes gpg
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
		apt install --yes jq yq
	fi
fi

## now that jq was installed (above) we can auto-update GitHub's known host
## ref. https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
echo "* updating GitHub known hosts ▶️"
## Reminder: ~/.ssh is ensured by user--020ensure--present--ssh.sh
## fetched BEFORE removing the current ones: a failed fetch (network, rate limit…) must not leave GitHub unknown
## (empty on any failure: curl --fail fails on HTTP errors, jq fails if no .ssh_keys)
GITHUB_KNOWN_HOSTS="$(curl --fail --silent --show-error --location https://api.github.com/meta | jq --raw-output '.ssh_keys | .[]' | sed 's/^/github.com /')"
if [ -z "$GITHUB_KNOWN_HOSTS" ]; then
	echo "* couldn't fetch GitHub's ssh host keys, keeping the current ones ❌"
else
	## -R = remove all keys of this host, -f = from this known_hosts file
	ssh-keygen -R github.com -f "$HOME/.ssh/known_hosts"
	## replace with the most recent ones we just fetched
	printf '%s\n' "$GITHUB_KNOWN_HOSTS" >> "$HOME/.ssh/known_hosts"
	echo "* GitHub known hosts up-to-date ✅"
fi


## test if GitHub is connected
## (2026 not needed if cloning with https instead of ssh)
#ssh -T git@github.com || true

#############################################################
echo "* …all done ✅"
