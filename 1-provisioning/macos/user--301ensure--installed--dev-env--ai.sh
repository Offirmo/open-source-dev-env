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

## Native installer: (macOS/Linux)
curl -fsSL https://claude.ai/install.sh | bash
#brew install --cask claude-code

## https://github.com/openai/codex
brew install --cask codex

## https://agent-safehouse.dev/
brew install eugene1g/safehouse/agent-safehouse

## Destructive Command Guard
## https://github.com/Dicklesworthstone/destructive_command_guard
curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh?$(date +%s)" | bash -s -- --easy-mode


npx skills add \
 vercel-labs/agent-browser --skill dogfood

npx skills add   anthropics/claude-plugins-official              -g --agent claude-code
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
