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

#export SIMPLI_USER_WORKING_DIR=/home/yej/work
#export SIMPLI_USER_BIN_DIR=/home/yej/work/bin

## auto-load root bashrc files
#source /work/bin/.bashrc
#source_bash_files_from_dir "/work/bin/bashrc.d"

## auto-load user bashrc files
##source_bash_files_from_dir "/home/yjutard/work/bin/dotfiles"

