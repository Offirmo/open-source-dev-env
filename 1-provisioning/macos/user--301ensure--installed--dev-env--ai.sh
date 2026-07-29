#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2026"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting…"

## Mistral AI vibe
## https://mistral.ai/products/vibe
#curl -LsSf https://mistral.ai/vibe/install.sh | bash


## Claude Code
## Native installer: (macOS/Linux)
curl -fsSL https://claude.ai/install.sh | bash
#brew install claude-code
#claude --chrome Enable Claude in Chrome integration
#claude plugin list
#claude plugin prune

install_claude_plugins() {
    local marketplace="${1:?Usage: install_claude_plugins MARKETPLACE PLUGIN...}"
    shift

    if (( $# == 0 )); then
        echo "Error: provide at least one plugin" >&2
        return 1
    fi

    local plugin
    for plugin in "$@"; do
        echo "Installing ${plugin}@${marketplace}..."

        if ! claude plugin install "${plugin}@${marketplace}"; then
            echo "Failed to install: ${plugin}@${marketplace}" >&2
            return 1
        fi
    done
}

## https://github.com/anthropics/claude-code/blob/main/plugins/README.md
## https://claudemarketplaces.com/plugins/anthropics-claude-code
claude plugin marketplace add anthropics/claude-code
plugins=(
	"code-review"
	"commit-commands"
	"feature-dev"
	"frontend-design"
	"hookify"
	"pr-review-toolkit"
	"security-guidance"
)
install_claude_plugins "claude-code-plugins" "${plugins[@]}"


## https://github.com/anthropics/claude-plugins-official/tree/main
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin install                github@claude-plugins-official
claude plugin install         skill-creator@claude-plugins-official
claude plugin install        typescript-lsp@claude-plugins-official
claude plugin install            playwright@claude-plugins-official
claude plugin install       commit-commands@claude-plugins-official
claude plugin install       code-simplifier@claude-plugins-official
claude plugin install   chrome-devtools-mcp@claude-plugins-official
claude plugin install     claude-code-setup@claude-plugins-official
claude plugin install  claude-md-management@claude-plugins-official
claude plugin install             atlassian@claude-plugins-official
claude plugin install                 figma@claude-plugins-official



claude plugin install        webapp-testing@claude-plugins-official


## https://github.com/openai/codex
brew install codex


## https://agent-safehouse.dev/
brew install eugene1g/safehouse/agent-safehouse


## Destructive Command Guard
## https://github.com/Dicklesworthstone/destructive_command_guard
curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh?$(date +%s)" | bash -s -- --easy-mode

## XXX TODO review https://github.com/vercel-labs/skills
## direct claude invocation may be better claude plugin install figma@claude-plugins-official

## https://www.skills.sh/anthropics/skills
## https://github.com/anthropics/claude-code/blob/main/plugins/README.md

npx skills add \
 vercel-labs/agent-browser --skill dogfood

npx skills add   anthropics/claude-plugins-official                                -g --agent claude-code

npx skills add   anthropics/claude-plugins-official@claude-automation-recommender  -g --agent claude-code
npx skills add   anthropics/claude-plugins-official@claude-md-improver             -g --agent claude-code
npx skills add   anthropics/claude-plugins-official@command-development            -g --agent claude-code
npx skills add   anthropics/claude-plugins-official@hook-development               -g --agent claude-code

npx skills add   anthropics/skills@claude-api                                      -g --agent claude-code
npx skills add   anthropics/skills@mcp-builder                                     -g --agent claude-code
npx skills add   https://github.com/anthropics/claude-code --skill 'Writing Hookify Rules' -g --agent claude-code
npx skills add   https://github.com/jezweb/claude-skills --skill claude-agent-sdk  -g --agent claude-code
npx skills add   https://github.com/mcp-use/mcp-use --skill mcp-apps-builder       -g --agent claude-code

#############################################################
echo "* …all done ✅"
