#! /bin/bash

## Shell provision script

echo "#########################"
echo "# NON root provisioning #"
echo "#########################"

## debug informations
echo "* revision = circa 2023"
echo "* start ENV"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - BASH_SOURCE   = $BASH_SOURCE"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
echo "  - PATH          = $PATH"
## full env
#env


############ macOS settings ############
## https://apple.stackexchange.com/questions/340542/show-hidden-files-on-mac-os-x-mojave-using-terminal/340543#340543
## Or use shortcut: (in finder) Cmd ⌘ + Shift ⇧ + .  (full stop, period)
defaults write com.apple.finder AppleShowAllFiles -boolean true
## macOs disable shell warning
## https://support.apple.com/en-us/HT208050
echo "export BASH_SILENCE_DEPRECATION_WARNING=1" >> ~/.bash_profile


############ Global settings ############
## global gitignore
echo ".DS_Store" >> ~/.gitignore


############ Tools settings ############

## now that jq was installed (previous script) we can auto-update GitHub's known host
## ref. https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/
ssh-keygen -R github.com
curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >> ~/.ssh/known_hosts


echo "* all done."
