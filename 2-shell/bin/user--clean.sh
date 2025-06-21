#! /bin/bash

############ cleanups ############
echo "* […open-source-dev-env/…/user--clean.sh] hello!"

############ Global package managers ############

## brew (macOS)
## last reviewed: 2025/06
if command -v brew > /dev/null; then
	echo ""
	echo "******* \`brew\` detected, cleaning… *******"
	brew cleanup --prune=14
	## brew cleanup -s
fi


## MacPorts (macOS)
## https://guide.macports.org/chunked/using.html#using.port
## last reviewed: TODO!!!
if command -v port > /dev/null; then
	echo ""
	echo "******* MacPorts detected, cleaning… *******"

	echo "  * \`sudo port reclaim\`…"
	sudo port reclaim
fi


############ Dev Env -- node ############
## nvm
## last reviewed: 2025/06
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ -n $DETECTED_NVM_DIR ]]; then
	## https://github.com/nvm-sh/nvm
	echo ""
	echo "******* \`nvm\` detected, listing… *******"
	[ -s "$DETECTED_NVM_DIR/nvm.sh" ] && \. "$DETECTED_NVM_DIR/nvm.sh"  # This loads nvm
	nvm cache clear
	## list available node installs
	## but cleaning will need to be done manually
	nvm ls
fi


## various node/js package managers
if command -v yarn > /dev/null; then
	yarn cache clean
fi
if command -v npm > /dev/null; then
	npm cache clean --force
fi
rm -rf ~/.npm-pkgr/
rm -rf ~/.npm_lazy
rm -rf ~/.npm

## TODO other dev envs ex. Python, Rust...

## docker
docker system prune --all
#docker volume prune

## xcode device emulators
xcrun simctl delete unavailable
xcrun simctl erase all

## virtualbox
#vboxmanage modifymedium disk "/Users/xxx/VirtualBox VMs/Ubuntu 16 C/Ubuntu 16 C-disk1.vdi" --compact


# rmdir /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/com.apple.CoreSimulator.SimDevice.*
# find /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T -type d -name "com.apple.CoreSimulator.SimDevice.*" -exec rm -r {} +
# rm -d /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/com.apple.CoreSimulator.SimDevice.*
# rm -d /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/ssh-*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--15919215*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--1591921*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/*.log
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/SourceTreeTemp.*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/.com.insomnia*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/.org.efounders*
