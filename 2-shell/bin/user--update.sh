#! /bin/bash

############ updates ############
echo
echo "* […ode/…/user--update.sh] hello!"
echo "************ Updating your system… ************"
echo


## IMPORTANT
## for package managers, the usual pattern is
## update (metadata) -> upgrade (the tool & packages themselves)


############ OS ############
## last reviewed: 2023/09
if command -v softwareupdate > /dev/null; then
	echo "******* macOS updates… *******"
	softwareupdate  --install  --safari-only  ## those don't require a restart
	softwareupdate  --list
	echo
fi


############ Global package managers ############

## brew (macOS)
## last reviewed: 2023/09
if command -v brew > /dev/null; then
	echo "******* \`brew\` detected, updating… *******"

	echo "  * 1. \`update\`…"
	brew update

	echo "  * 2. \`upgrade --yes\`…"
	brew upgrade --yes
	echo "    * also consider running: brew upgrade --greedy --yes"

	echo "  * 3. \`cleanup\`…"
	brew cleanup

	echo "  * \`doctor\`…"
	brew doctor
	echo
fi


## MacPorts (macOS)
## https://guide.macports.org/chunked/using.html#using.port
## last reviewed: 2025/09
if command -v port > /dev/null; then
	echo "******* MacPorts detected, updating… *******"
	## https://guide.macports.org/chunked/using.common-tasks.html
	echo "  * 1. \`selfupdate\`…"
	sudo port selfupdate
	echo "  * 2. \`upgrade\`…"
	sudo port upgrade outdated
	echo
fi


## apt (Ubuntu)
## last reviewed: 2026/05
if command -v apt > /dev/null; then
	echo "******* Ubuntu's Advanced Packaging Tool detected, updating… *******"
	## https://blog.packagecloud.io/you-need-apt-get-update-and-apt-get-upgrade/
	echo "  * 1. \`update\`…"
	sudo apt update
	echo "  * 2. \`upgrade\`…"
	sudo apt upgrade
	echo "    * also consider running: apt full-upgrade"
	echo
fi


## Claude Code
if command -v claude > /dev/null; then
	echo "******* Claude Code detected, updating… *******"
	#echo "  * 1. \`update\`…"
	#claude update  NO this is an alias of upgrade
	echo "  * \`upgrade\`…"
	claude upgrade

	echo "* Updating all marketplaces…"
	claude plugin marketplace update
	echo
	echo "* Updating all installed plugins…"

	# Enumerate up-front so a failed listing is a hard error, not a silent
	# "no plugins found" (process substitution failures escape set -euo pipefail).
	plugins=$(claude plugin list --json | jq -r '.[] | "\(.id)\t\(.scope)"') \
	  || { echo "  Failed to list installed plugins" >&2; exit 1; }

	if [[ -z "${plugins}" ]]; then
		echo "  No installed plugins found."
	else
		# Disabled plugins are updated too: `claude plugin update` succeeds on them,
		# and keeping them current matches the "update all" intent.
		failed=()
		count=0
		while IFS=$'\t' read -r id scope; do
		  [[ -z "${id}" ]] && continue
		  count=$((count + 1))
		  echo "--- ${id} (scope: ${scope})"
		  if ! claude plugin update "${id}" --scope "${scope}"; then
			 failed+=("${id}")
		  fi
		done <<< "${plugins}"
		echo

		if [[ ${#failed[@]} -gt 0 ]]; then
		  echo "  Failed to update: ${failed[*]}" >&2
		fi

		echo "${count} plugins updated. Restart Claude Code to apply updates."
	fi
fi



## mise
if command -v mise &> /dev/null; then
	## https://mise.jdx.dev/cli/self-update.html#mise-self-update
	mise self-update
fi


############ Dev Env -- node ############
## nvm
## last reviewed: 2023/09
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#echo "DETECTED_NVM_DIR = $DETECTED_NVM_DIR"
#echo "DETECTED_NVM_DIR- = ${DETECTED_NVM_DIR:-}"
if [[ -d "$DETECTED_NVM_DIR" ]]; then
	echo "******* \`nvm\` dir detected BUT ignoring *******"

	## https://github.com/nvm-sh/nvm
#	echo
#	echo "******* \`nvm\` detected, updating… *******"
#	## 1) update nvm
#	## (no profile update, we do it ourselves https://github.com/nvm-sh/nvm?tab=readme-ov-file#additional-notes )
#	PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash'
#	## 2) (re)load it
#	. "${DETECTED_NVM_DIR:-}/nvm.sh"
#	## 3) install latest lts
#	set +e
#	nvm install 'lts/*'
#	NVM_RETURN=$?
#	set -e
#	echo "INSTALL RETURN $NVM_RETURN"
#	## 3b) install critical packages with this lts
#	## TODO review, avn doesn't work 2024/04
#	#npm install --global avn avn-nvm
#	#avn setup
	echo
fi



############ Dev Env -- Python ############
## pip
if command -v pip > /dev/null; then
	echo "******* \`pip\` detected, updating… *******"
	pip install --upgrade pip
	echo
fi


############ Dev Env -- ruby ############
#rvm get stable



############ Dev Env -- Java ############



############ Dev Env -- Rust ############
if command -v rustup > /dev/null; then
	echo "******* Rust detected, updating… *******"
	rustup update
	echo
fi



############ Dev Env -- Go ############
