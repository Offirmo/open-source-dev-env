#! /bin/bash

## REM : this file is meant to conveniently complement ~/.bashrc
##       It is supposed to be called in login and non-login shells, after ~/.bashrc

[ "$VERBOSE__RC" == true ] && echo "* hello from: …open-source-dev-env/…/load_shellrc.sh"

## useful function
source_bash_files_from_dir() {
	for file in $(ls -tr $1/*.sh | sort -t ' ' -k 1 -g); do
		#echo "now loading $file..."
		source "$file"
	done

	#case $SHELL in
	#/bin/bash)
	#	for file in $(ls -tr $1/*.bash); do
	#		source "$file"
	#	done
	#	;;

	#/bin/zsh)
	#	for file in $(ls -tr $1/*.zsh); do
	#		source "$file"
	#	done
	#	;;
	#esac
}

source_bash_files_from_dir "$HOME/work/src/off/open-source-dev-env/2-shell/shellrc"
source_bash_files_from_dir "$HOME/work/bin/shellrc"
