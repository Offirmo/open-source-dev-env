echo "* hello from settings.sh"

## http://stackoverflow.com/questions/8965606/node-and-error-emfile-too-many-open-files
ulimit -n 4096
ulimit -c unlimited

############ Git ############
git config --global push.default simple
git config --global color.ui "auto"
