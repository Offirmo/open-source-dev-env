#!/bin/bash
input=$(cat)

############################################################
## https://code.claude.com/docs/en/statusline#display-multiple-lines

############################################################
## source data

MODEL=$(echo "$input" | jq -r '.model.id')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
TOKENS_USED=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
WINDOW_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 0')
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

############################################################
## consts
CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

format_tokens() {
  awk -v n="$1" 'BEGIN {
    if (n >= 1000000) { v = n / 1000000; fmt = (v == int(v)) ? "%d" "M" : "%.1f" "M" }
    else if (n >= 1000) { v = n / 1000; fmt = (v == int(v)) ? "%d" "K" : "%.1f" "K" }
    else { v = n; fmt = "%d" }
    printf fmt, v
  }'
}

############################################################
WINDOW_FMT=$(format_tokens "$WINDOW_SIZE")
TOKENS_USED_FMT=$(format_tokens "$TOKENS_USED")

# Pick bar color based on context usage
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
printf -v FILL "%${FILLED}s"; printf -v PAD "%${EMPTY}s"
BAR="${FILL// /▓}${PAD// /░}"

MINS=$((DURATION_MS / 60000)); SECS=$(((DURATION_MS % 60000) / 1000))

BRANCH="n/a"
git rev-parse --git-dir > /dev/null 2>&1 && BRANCH="$(git branch --show-current 2>/dev/null)"

COST_FMT=$(printf '$%.2f' "$COST")
DATE_FMT=$(date '+%Y/%m/%d %A')

############################################################
## ai quip (best-effort, never breaks the statusline)

QUIP_SCRIPT="$HOME/.claude/fortune.js"
QUIP=""
if command -v node > /dev/null 2>&1 && [ -f "$QUIP_SCRIPT" ]; then
  if command -v timeout > /dev/null 2>&1; then
    QUIP=$(timeout 1s node "$QUIP_SCRIPT" 2>/dev/null)
  else
    QUIP=$(node "$QUIP_SCRIPT" 2>/dev/null)
  fi
fi
[ -z "$QUIP" ] && QUIP="...silent running (node offline)."

############################################################

echo -e "⎡ 📁 ${DIR##*/}/  🌿 ${BRANCH}  📅 ${DATE_FMT}"
echo -e "⎜ 🧠 ${CYAN}${MODEL}${RESET}  ${BAR_COLOR}${BAR}${RESET} ${TOKENS_USED_FMT}/${WINDOW_FMT} ${PCT}%   ⏱️ ${MINS}m ${SECS}s  💸 ${YELLOW}${COST_FMT}${RESET}"
echo -e "⎣ 🤖💬 \"${QUIP}\""
