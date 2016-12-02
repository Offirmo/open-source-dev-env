echo "* hello from: settings.sh"

## http://stackoverflow.com/questions/8965606/node-and-error-emfile-too-many-open-files
ulimit -n 4096
ulimit -c unlimited

############ Git ############
git config --global push.default simple
git config --global color.ui "auto"
git config --global core.excludesfile "$HOME/work/src/open-source-dev-env/misc/global.gitignore"

## JAVA
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java
