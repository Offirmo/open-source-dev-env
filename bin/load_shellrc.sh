#! /bin/bash

## REM : this file is meant to conveniently complement ~/.bashrc
##       It is supposed to be called in login and non-login shells, after ~/.bashrc

echo "* hello from: …open-source-dev-env/bin/load_shellrc.sh"

## useful function
source_bash_files_from_dir()
{
	for file in `ls -tr $1/*`
	do
		#echo "sourcing $file"
		source "$file"
	done
}

source_bash_files_from_dir "$HOME/work/src/off/open-source-dev-env/shellrc"
source_bash_files_from_dir "$HOME/work/bin/shellrc"
