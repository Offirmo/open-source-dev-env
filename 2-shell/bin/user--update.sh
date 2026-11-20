#! /bin/bash

############ updates ############
echo
echo "* […ode/…/user--update.sh] hello!"
echo "************ Updating your system… ************"


## IMPORTANT
## for package managers, the usual pattern is
## update (metadata) -> upgrade (the tool & packages themselves)


############ OS ############
## last reviewed: 2023/09
if command -v softwareupdate > /dev/null; then
	echo
	echo "******* macOS updates… *******"
	echo "↳ 1. \`--safari-only\`…"
	softwareupdate  --install  --safari-only  ## those don't require a restart
	echo "↳ 2. \`--list\`…"
	softwareupdate  --list
fi


############ Global package managers ############

## brew (macOS)
## last reviewed: 2023/09
if command -v brew > /dev/null; then
	echo
	echo "******* \`brew\` detected, updating… *******"

	echo "↳ 1. \`update\`…"
	brew update

	echo "↳ 2. \`upgrade --yes\`…"
	brew upgrade --yes
	echo "  ↳ also consider running: brew upgrade --greedy --yes"

	echo "↳ 3. \`cleanup\`…"
	brew cleanup

	echo "↳ \`doctor\`…"
	brew doctor
fi


## MacPorts (macOS)
## https://guide.macports.org/chunked/using.html#using.port
## last reviewed: 2025/09
if command -v port > /dev/null; then
	echo
	echo "******* MacPorts detected, updating… *******"
	## https://guide.macports.org/chunked/using.common-tasks.html
	echo "↳ 1. \`selfupdate\`…"
	sudo port selfupdate
	echo "↳ 2. \`upgrade\`…"
	sudo port upgrade outdated
fi


## apt (Ubuntu)
## last reviewed: 2026/05
if command -v apt > /dev/null; then
	echo
	echo "******* Ubuntu's Advanced Packaging Tool detected, updating… *******"
	## https://blog.packagecloud.io/you-need-apt-get-update-and-apt-get-upgrade/
	echo "↳ 1. \`update\`…"
	sudo apt update
	echo "↳ 2. \`upgrade\`…"
	sudo apt upgrade
	echo "  ↳ also consider running: apt full-upgrade"
fi



############ Tools (may include their own package management) ############

## mise
## last reviewed: 2026/11
if command -v mise &> /dev/null; then
	echo
	echo "******* \`mise\` detected, updating… *******"
	## https://mise.jdx.dev/cli/self-update.html#mise-self-update
	echo "↳ 1. \`self-update\`…"
	mise self-update --yes
	## https://mise.jdx.dev/cli/upgrade.html
	## upgrades each tool within its requested range (ex. python@3 → latest 3.x, which ships a recent pip)
	echo "↳ 2. \`upgrade\`…"
	mise upgrade
	echo "  ↳ old versions are kept, consider running: mise prune"
fi


## Claude Code
## last reviewed: 2026/11
if command -v claude > /dev/null; then
	echo
	echo "******* Claude Code detected, updating… *******"
	#echo "* 1. \`update\`…"
	#claude update  NO this is an alias of upgrade
	echo "↳ \`upgrade\`…"
	claude upgrade

	echo "↳ Updating all marketplaces…"
	claude plugin marketplace update
	echo
	echo "↳ Updating all installed plugins…"

	## NOT piped into jq: without pipefail only jq's exit code would be seen,
	## and jq exits 0 on empty input = a failed listing would look like "no plugins"
	if ! plugins_json="$(claude plugin list --json)"; then
		echo "  ↳ ❌ failed to list installed plugins, skipping their update" >&2
	elif ! plugins="$(jq --raw-output '.[] | "\(.id)\t\(.scope)"' <<< "${plugins_json}")"; then
		echo "  ↳ ❌ failed to parse installed plugins, skipping their update" >&2
	elif [[ -z "${plugins}" ]]; then
		echo "  ↳ No installed plugins found."
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

		if [[ ${#failed[@]} -gt 0 ]]; then
		  echo "  ↳ Failed to update: ${failed[*]}" >&2
		fi

		echo "  ↳ $((count - ${#failed[@]}))/${count} plugins updated. Restart Claude Code to apply updates."
	fi
fi


## iTerm2 shell integration https://iterm2.com/documentation-shell-integration.html
## last reviewed: 2026/11
## downloaded on demand (never refreshed) by 2-shell/shellrc/_sub_tools.sh, same location
## -> refreshing only the ones present = the shells actually used
## (XDG base dir = the spec default when unset or empty)
ITERM2_INTEGRATION_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/iterm2"
if [[ -d "$ITERM2_INTEGRATION_DIR" ]]; then
	echo
	echo "******* iTerm2 shell integration detected, updating… *******"
	for shell_name in bash zsh; do
		integration_file="$ITERM2_INTEGRATION_DIR/shell_integration.$shell_name"
		[[ -f "$integration_file" ]] || continue
		echo "↳ ${shell_name}…"
		## --fail + tmp file then mv: never replace a working file with an error page or a partial download
		if ! { curl --fail --silent --show-error --location --max-time 30 "https://iterm2.com/shell_integration/$shell_name" \
				--output "$integration_file.tmp" \
			&& mv "$integration_file.tmp" "$integration_file"; }; then
			rm -f "$integration_file.tmp"
			echo "  ↳ ❌ failed to download, keeping the current one" >&2
		fi
	done
fi



############ Dev Env -- node ############
## nvm
## last reviewed: 2023/09
DETECTED_NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#echo "DETECTED_NVM_DIR = $DETECTED_NVM_DIR"
#echo "DETECTED_NVM_DIR- = ${DETECTED_NVM_DIR:-}"
if [[ -d "$DETECTED_NVM_DIR" ]]; then
	echo
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

# pnpm doctor


############ Dev Env -- Python ############
## pip
## last reviewed: 2026/11
## using `python3 -m pip` so that the interpreter we check is the one owning the pip we upgrade
function is_python3_externally_managed {
	## PEP 668 https://peps.python.org/pep-0668/#marking-an-interpreter-as-using-an-external-package-manager
	python3 -I -c 'import os, sys, sysconfig
marker = os.path.join(sysconfig.get_path("stdlib"), "EXTERNALLY-MANAGED")
sys.exit(0 if os.path.isfile(marker) else 1)'
}
if command -v python3 > /dev/null && python3 -m pip --version &> /dev/null; then
	echo
	echo "******* \`pip\` detected… *******"
	if is_python3_externally_managed; then
		echo "↳ externally managed (PEP 668) → skipping, upgrade it through its owner (brew, apt…)"
	else
		echo "↳ updating…"
		## our 2-shell/_.profile.sh sets PIP_REQUIRE_VIRTUALENV=true as a guardrail, this upgrade is intentionally global
		PIP_REQUIRE_VIRTUALENV=false python3 -m pip install --upgrade pip
	fi
fi


############ Dev Env -- ruby ############
#rvm get stable



############ Dev Env -- Java ############



############ Dev Env -- Rust ############
if command -v rustup > /dev/null; then
	echo
	echo "******* Rust detected, updating… *******"
	echo "↳ \`update\`…"
	rustup update
fi



############ Dev Env -- Go ############
