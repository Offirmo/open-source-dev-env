#! /bin/bash

############ cleanups ############
echo
echo "* […ode/…/user--clean.sh] hello!"
echo "************ Cleaning your system… ************"



############ OS ############
## macOS = delete tmp stuff, but only stuff belonging to the current user
## - only OLD stuff: running apps keep their runtime files there (Claude Code, Docker, tmux…)
## - only files + empty dirs, NOT sockets: their mtime = creation time, ex. launchd's ssh-agent socket lives as long as the session
## (Linux: /tmp is cleaned by systemd-tmpfiles)
if [[ -d /private/tmp ]]; then
	find /private/tmp -xdev -mindepth 1 -user "$(id -un)" -depth \( -type f -o -type d -empty \) -mtime +2 -delete
fi



############ Global package managers ############

## brew (macOS)
## last reviewed: 2025/06
if command -v brew > /dev/null; then
	echo
	echo "******* \`brew\` detected, cleaning… *******"
	echo "↳ \`cleanup --prune=14\`…"
	brew cleanup --prune=14
	## brew cleanup -s
fi


## MacPorts (macOS)
## https://guide.macports.org/chunked/using.html#using.port
## last reviewed: 2025/09
if command -v port > /dev/null; then
	echo
	echo "******* MacPorts detected, cleaning… *******"
	## https://guide.macports.org/chunked/using.common-tasks.html
	echo "↳ \`uninstall inactive\`…"
	sudo port uninstall inactive
	## https://guide.macports.org/chunked/using.html#using.port.reclaim
	echo "↳ \`reclaim\`…"
	sudo port reclaim
fi


## apt (Ubuntu)
## last reviewed: 2026/05
if command -v apt > /dev/null; then
	echo
	echo "******* apt detected, cleaning… *******"
	## fix possible unmet dependencies
	echo "↳ \`install --fix-broken\`…"
	sudo apt install --fix-broken
	echo "↳ \`autoclean\`…"
	sudo apt --yes autoclean
	echo "↳ \`clean\`…"
	sudo apt --yes clean
	echo "↳ \`autoremove --purge\`…"
	sudo apt --yes autoremove --purge
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
	echo
	echo "******* \`nvm\` detected, cleaning… *******"
	[ -s "$DETECTED_NVM_DIR/nvm.sh" ] && \. "$DETECTED_NVM_DIR/nvm.sh"  # This loads nvm
	echo "↳ \`cache clear\`…"
	nvm cache clear
	## list available node installs
	## but cleaning will need to be done manually
	echo "↳ Please review those installed node.js:"
	nvm ls
fi


## various node/js package managers
if command -v yarn > /dev/null; then
	echo
	echo "******* yarn detected, cleaning… *******"
	echo "↳ \`cache clean\`…"
	yarn cache clean
fi
if command -v npm > /dev/null; then
	echo
	echo "******* npm detected, cleaning… *******"
	echo "↳ \`cache clean --force\`…"
	npm cache clean --force
fi
if command -v pnpm > /dev/null; then
	echo
	echo "******* pnpm detected, cleaning… *******"
	echo "↳ \`cache delete\`…"
	## https://pnpm.io/cli/cache-delete
	pnpm cache delete
	echo "↳ removing the store…"
	## https://pnpm.io/uninstall#removing-the-global-content-addressable-store
	rm -rf "$(pnpm store path)"
fi
rm -rf ~/.npm-pkgr/
rm -rf ~/.npm_lazy
rm -rf ~/.npm

## TODO other dev envs ex. Python, Rust...

## Claude Code
#if [[ -d "${HOME}/.claude/" ]]; then
#	echo
#	echo "******* Claude Code detected, cleaning… *******"
#	claude plugin prune
#	find "${HOME}/.claude/backups"         -mindepth 1 -delete
#	find "${HOME}/.claude/file-history"    -mindepth 1 -delete
#	find "${HOME}/.claude/jobs"            -mindepth 1 -delete
#	find "${HOME}/.claude/plugins/cache"   -mindepth 1 -delete
#	find "${HOME}/.claude/plugins/data"    -mindepth 1 -delete
#	rm -rf "${HOME}/.claude/plugins/plugin-catalog-cache.json"
#	find "${HOME}/.claude/projects"        -mindepth 1 -delete
#	find "${HOME}/.claude/sessions"        -mindepth 1 -delete
#	find "${HOME}/.claude/shell-snapshots" -mindepth 1 -delete
#	find "${HOME}/.claude/tasks"           -mindepth 1 -delete
#	find "${HOME}/.claude/teams"           -mindepth 1 -delete
#	rm -rf "${HOME}/.claude/mcp-needs-auth-cache.json"
#	rm -rf "${HOME}/.claude/stats-cache.json"
#fi

## docker/podman
if command -v docker > /dev/null; then
	## Note: the CLI can be installed while the daemon is stopped,
	# so probe before pruning, otherwise the command errors out
	if docker info > /dev/null 2>&1; then
		echo
		echo "******* Docker detected, cleaning… *******"
		docker system prune --all
		#docker volume prune
	else
		echo
		echo "******* Docker detected but daemon not running, skipping. *******"
	fi
fi
if command -v podman > /dev/null; then
	## Note: the CLI can be installed while the daemon is stopped,
	# so probe before pruning, otherwise the command errors out
	if podman info > /dev/null 2>&1; then
		echo
		echo "******* podman detected, cleaning… *******"
		podman system prune --all
	else
		echo
		echo "******* podman detected but daemon not running, skipping. *******"
	fi
fi

## xcode device emulators
if xcrun simctl -h >/dev/null 2>&1; then
	echo
	echo "******* xcode device emulator detected, cleaning… *******"
	xcrun simctl delete unavailable
	xcrun simctl erase all
fi

## virtualbox
#vboxmanage modifymedium disk "/Users/xxx/VirtualBox VMs/Ubuntu 16 C/Ubuntu 16 C-disk1.vdi" --compact
