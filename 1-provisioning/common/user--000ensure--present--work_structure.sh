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


############ Gnome/Ubuntu user-specific dirs ############
## seems to be expected by "virtualenv" (python tool)
## https://askubuntu.com/a/14536
## spec https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
mkdir -p ~/.cache
mkdir -p ~/.config
mkdir -p ~/.local
mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir -p ~/.local/state
echo "* user dir structure ✅"

############ Offirmo data structure ############
mkdir -p ~/work
mkdir -p ~/work/bin
mkdir -p ~/work/bin/shellrc
if [ ! -f ~/work/bin/shellrc/00-init.sh ]; then
	{
		echo '#@IgnoreInspection BashAddShebang'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/00-init.sh] hello!"'
		echo ''
	} >> ~/work/bin/shellrc/00-init.sh
fi
if [ ! -f ~/work/bin/shellrc/aliases.sh ]; then
	{
		echo '#@IgnoreInspection BashAddShebang'
		echo '[[ "$VERBOSE__RC" == true ]] && echo "$(date +%H:%M:%S) ↳ […work/aliases.sh] hello!"'
		echo ''
		echo 'alias foo='\''cd ~/work/src/bar/'\'''
	} >> ~/work/bin/shellrc/aliases.sh
fi

#mkdir -p ~/work/containers
mkdir -p ~/work/docs
mkdir -p ~/work/install
mkdir -p ~/work/src
mkdir -p ~/work/tmp
echo "* ~/work structure ✅"


#############################################################
echo "* …all done ✅"
