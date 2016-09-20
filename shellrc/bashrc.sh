## REM : this file is meant to conveniently complement ~/.bashrc
##       It is supposed to run in login and non-login shells, after ~/.bashrc

echo "hello from 'virtualized-open-source-dev-env/shellrc/bashrc.sh"

## useful function
source_bash_files_from_dir()
{
	local target="$1/*"

	for file in `ls -tr $1/*`
	do
		[ -f "$file" ] && source "$file"
	done
}

#export SIMPLI_USER_WORKING_DIR=~/work
#export SIMPLI_USER_BIN_DIR=~/work/bin

source_bash_files_from_dir "~/work/src/virtualized-open-source-dev-env/shellrc/modules"
