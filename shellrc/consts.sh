echo "* hello from: …open-source-dev-env/shellrc/consts.sh"

## disable sentry and other stuff
export OFFIRMO_IS_HERE=1

## Java
## taken from???
if [[ -f /usr/libexec/java_home ]]; then
	export JAVA_HOME=$(/usr/libexec/java_home)
	#export JAVA_HOME=$(/usr/libexec/java_home --version 1.8)
fi
