

◆  Which agents do you want to install to?
│
│  ── Universal (.agents/skills) ── always included ────────────
│    • Amp
│    • Antigravity
│    • Cline
│    • Codex
│    • Cursor
│    • Deep Agents
│    • Dexto
│    • Firebender
│    • Gemini CLI
│    • GitHub Copilot
│    • Kimi Code CLI
│    • OpenCode
│    • Warp
│    • Zed
│
│  ── Additional agents ─────────────────────────────
│  Search:
│  ↑↓ move, space select, enter confirm
│
│   ○ AiderDesk (.aider-desk/skills)
│   ○ Augment (.augment/skills)
│   ○ IBM Bob (.bob/skills)
│ ❯ ○ Claude Code (.claude/skills)
│   ○ OpenClaw (skills)
│   ○ CodeArts Agent (.codeartsdoer/skills)
│   ○ CodeBuddy (.codebuddy/skills)
│   ○ Codemaker (.codemaker/skills)
│  ↓ 32 more



## two Anthropic plugin marketplaces

- claude-code-plugins is the anthropics/claude-code repo, which has a plugins/ folder. Your local copy is a git clone, last updated
  2026-10-19.
- claude-plugins-official is Anthropic's official marketplace: the one the docs point to, registered automatically, and the source of
  your other 13 plugins. Last updated 2026-10-20.
- All 7 plugins you install from claude-code-plugins also exist in the official marketplace. You already have commit-commands from
  both, with the official one disabled.

  for p in code-review commit-commands feature-dev frontend-design pr-review-toolkit security-guidance hookify; do claude plugin uninstall "$p@claude-code-plugins"; done
  claude plugin marketplace remove claude-code-plugins
