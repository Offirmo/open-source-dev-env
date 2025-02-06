#!/bin/sh



unset NVM_DIR
export XDG_CONFIG_HOME=foo

echo "NVM_DIR = $NVM_DIR"
echo "XDG_CONFIG_HOME = $XDG_CONFIG_HOME"
echo "HOME = $HOME"
export NVM_DIR=$([ -n "${XDG_CONFIG_HOME-}" ] && printf "${XDG_CONFIG_HOME}/nvm" || [ -d "${HOME}/.nvm" ] && printf "${HOME}/.nvm" || printf  "$HOME/.config/nvm")
echo "NVM_DIR FINAL = $NVM_DIR"



#echo "NVM_DIR XX = ${NVM_DIR-${XDG_CONFIG_HOME-${HOME}}}"



#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"


#find -E . "./($XDG_CONFIG_HOME|$HOME|$HOME/.config)/"


#for dir in ./($XDG_CONFIG_HOME|$HOME|$HOME/.config)/) ; do
#	echo $dir
#    dir2=${dir%/}       # Remove the trailing /
#done


    # shellcheck disable=SC1090,SC1091 # it shouldn't check for nvm.sh
#    if [ -f "${NVM_DIR:-}/nvm.sh" ]; then
#        . "${NVM_DIR:-}/nvm.sh"
#    elif [ -f "$HOME/.nvm/nvm.sh" ]; then
#        . ~/.nvm/nvm.sh
#    elif [ -f "$HOME/.config/nvm/nvm.sh" ]; then
#        . ~/.config/nvm/nvm.sh
#    fi

#
#TARGET_FILE="hello.sh"
#
#LINE="# Offirmo settings"
#if ! grep -q "${LINE}" ${TARGET_FILE}; then
#	{
#		echo ""
#		echo "${LINE}"  # comment
#		echo "echo \"installed!\""   ## another comment
#		echo ""
#		echo ""
#	} >> "${TARGET_FILE}"
#
#	echo "New settings have been installed"
#else
#	echo "Setting already up to date"
#fi
