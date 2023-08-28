#@IgnoreInspection BashAddShebang
echo "* hello from: …open-source-dev-env/shellrc/_consts.sh"

## instructs some lib to expect debug API + SEC
export OFFIRMO_GLOBAL_DEBUG_ENV_EXPECTED=1

## disable sentry and other stuff
export OFFIRMO_IS_HERE=1

## Java
## taken from???
if [[ -f /usr/libexec/java_home ]]; then
	export JAVA_HOME=$(/usr/libexec/java_home)
	#export JAVA_HOME=$(/usr/libexec/java_home --version 1.8)
fi
