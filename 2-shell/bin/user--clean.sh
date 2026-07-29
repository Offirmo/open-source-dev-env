#! /bin/bash

############ cleanups ############
echo "* […ode/…/user--clean.sh] hello!"



########### OS ###########
## macOS = delete tmp stuff, but only stuff belonging to the current user
find /private/tmp -xdev -mindepth 1 -user "$(id -un)" -depth -delete


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
## last reviewed: 2025/09
if command -v port > /dev/null; then
	echo ""
	echo "******* MacPorts detected, cleaning… *******"
	## https://guide.macports.org/chunked/using.common-tasks.html
	echo "  * \`uninstall inactive\`…"
	sudo port uninstall inactive
	## https://guide.macports.org/chunked/using.html#using.port.reclaim
	echo "  * \`reclaim\`…"
	sudo port reclaim
fi


## apt (Ubuntu)
## last reviewed: 2026/05
if command -v apt > /dev/null; then
	echo ""
	echo "******* apt detected, cleaning… *******"
	## fix possible unmet dependencies
	echo "  * \`install --fix-broken\`…"
	sudo apt install --fix-broken
	echo "  * \`autoclean\`…"
	sudo apt -y autoclean
	echo "  * \`clean\`…"
	sudo apt -y clean
	echo "  * \`autoremove --purge\`…"
	sudo apt -y autoremove --purge
	## Note: if caught in a loop, use
	## sudo dpkg --purge
	## https://askubuntu.com/questions/337456/boot-100-and-cant-purge
fi



############ Dev Env -- node ############
## nvm
## last reviewed: 2025/06
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ -d $DETECTED_NVM_DIR ]]; then
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
	echo ""
	echo "******* yarn detected, cleaning… *******"
	yarn cache clean
fi
if command -v npm > /dev/null; then
	echo ""
	echo "******* npm detected, cleaning… *******"
	npm cache clean --force
	pnpm store prune
fi
if command -v pnpm > /dev/null; then
	echo ""
	echo "******* pnpm detected, cleaning… *******"
	## https://pnpm.io/uninstall#removing-the-global-content-addressable-store
	rm -rf "$(pnpm store path)"
fi
rm -rf ~/.npm-pkgr/
rm -rf ~/.npm_lazy
rm -rf ~/.npm

## TODO other dev envs ex. Python, Rust...

## Claude Code
if [[ -d "${HOME}/.claude/" ]]; then
	echo ""
	echo "******* Claude Code detected, cleaning… *******"
	find "${HOME}/.claude/backups"         -mindepth 1 -delete
	find "${HOME}/.claude/file-history"    -mindepth 1 -delete
	find "${HOME}/.claude/jobs"            -mindepth 1 -delete
	find "${HOME}/.claude/plugins/cache"   -mindepth 1 -delete
	find "${HOME}/.claude/plugins/data"    -mindepth 1 -delete
	rm -rf "${HOME}/.claude/plugins/plugin-catalog-cache.json"
	find "${HOME}/.claude/projects"        -mindepth 1 -delete
	find "${HOME}/.claude/sessions"        -mindepth 1 -delete
	find "${HOME}/.claude/shell-snapshots" -mindepth 1 -delete
	find "${HOME}/.claude/tasks"           -mindepth 1 -delete
	find "${HOME}/.claude/teams"           -mindepth 1 -delete
	rm -rf "${HOME}/.claude/mcp-needs-auth-cache.json"
	rm -rf "${HOME}/.claude/stats-cache.json"
fi

## docker/podman
if command -v docker > /dev/null; then
	echo ""
	echo "******* Docker detected, cleaning… *******"
	docker system prune --all
	#docker volume prune
fi
if command -v podman > /dev/null; then
	echo ""
	echo "******* podman detected, cleaning… *******"
	podman system prune --all
fi

## xcode device emulators
if xcrun simctl -h >/dev/null 2>&1; then
	echo ""
	echo "******* xcode device emulator detected, cleaning… *******"
	xcrun simctl delete unavailable
	xcrun simctl erase all
fi

## virtualbox
#vboxmanage modifymedium disk "/Users/xxx/VirtualBox VMs/Ubuntu 16 C/Ubuntu 16 C-disk1.vdi" --compact
