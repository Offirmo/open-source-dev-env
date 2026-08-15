# Repo Review (2026-07-31)

Full review of the repo, fanned out by root folder. ~64 findings total. No secrets, unsafe eval, or command-injection vectors found anywhere — the risk profile is broken/stale automation and privacy-by-inference, not exploitable security holes.

## 1-provisioning/ (27 files)

- **PROV-1** (bug) — `package.json` scripts 1-9: all point to `provisioning/...` but the real folder is `1-provisioning/`. Every `npm run provision--*` is broken.
- **PROV-2** (bug) — `ubuntu/superuser_install_dev.sh:54`: `apt-get install bubblewrap socat` missing `-y` (every sibling has it). Hangs under curl-pipe/non-interactive execution.
- **PROV-3** (bug) — `common/user--020ensure--present--ssh.sh:102`: `TARGET="~/.ssh/id_ed25519_$PERSONAL_USERNAME__GITHUB"` is double-quoted so `~` never expands. All downstream uses operate on a literal `~` path. Fix: unquote or use `$HOME`.
- **PROV-4** (bug) — same file, line 98: compares `$PERSONAL_USERNAME` (never set elsewhere) instead of `$PERSONAL_USERNAME__GITHUB`; dead/broken branch.
- **PROV-5** (bug/security) — same file, lines 136-137: `chmod 600 \`find ~/.ssh/* -type f\`` — unquoted backticks + unquoted glob. Breaks on empty results or filenames with spaces, silently leaving wrong perms on keys. Fix: `find ~/.ssh -type f -exec chmod 600 {} +`.
- **PROV-6** (consistency) — `macos/user--301ensure--installed--dev-env--ai.sh` and `macos/user--301ensure--installed--dev-env--tools.sh` both use ordinal 301, violating the unique-ordinal convention.
- **PROV-7** (bug) — `common/user--010ensure--settings--shell.sh:140`: `echo 'export export LC_ALL=en_US.UTF-8'` — typo'd duplicate `export` written into every provisioned `~/.bashrc`.
- **PROV-8** (consistency) — `ubuntu/*`: entirely different naming scheme (no ordinals) vs the `000/010/.../900 user--NNNensure--*` scheme elsewhere. README says ubuntu "no longer using" but scripts remain unmaintained.
- **PROV-9** (dead reference) — `ubuntu/user_change_settings.sh:31,41`: RVM key fetch from `hkp://keys.gnupg.net` (dead since ~2019) and JDK download from bintray.com (shut down 2021) — both will fail.
- **PROV-10** (dead reference) — `ubuntu/superuser_setup_apt.sh:31,38-39`: installs `python-software-properties` (removed since Ubuntu 16.04) and adds defunct PPAs `ppa:ethereum/ethereum`, `ppa:bitcoin/bitcoin`.
- **PROV-11** (consistency) — `1-provisioning/README.md` "300 = dev env" section lists only 4 scripts, omitting `--301--ai.sh`, `--310--llm.sh`, `--320--rust.sh`, `--330/--321--python.sh`, `--340--java.sh`, all of which exist on disk.
- **PROV-12** (dead code) — `common/user--321ensure--installed--dev-env--python.sh` and `macos/user--330ensure--installed--dev-env--python.sh` are near-empty stubs ("See OS-specific script instead!", "PLEASE REVIEW THIS FILE!") with everything commented out.
- **PROV-13** (cruft) — `macos/user--301ensure--installed--dev-env--ai.sh:98`: inline unresolved TODO `"atlassian" ## where is it defined?` left in shipped script.
- **PROV-14** (bug/style) — `macos/user--301ensure--installed--dev-env--tools.sh:100-101`: `brew install semgrep` immediately followed by bare `semgrep --config=auto` — runs a full scan of whatever directory happens to be cwd during provisioning; looks like a leftover test line.
- **PROV-15** (best practice) — no script anywhere uses `set -euo pipefail`; combined with pervasive unquoted vars/backticks, one failed step (e.g. no network) silently falls through to unrelated later steps, undermining the "ensure" idempotency guarantee.

Watch-item (not separately numbered): curl-pipe-to-bash/sudo installs (Homebrew, Claude Code, rustup) all use official vendor-documented invocations; rustup's is well-hardened (`--proto '=https' --tlsv1.2`), others are unpinned HEAD/latest but match upstream docs.

## 2-shell/ (13 files) — sourced into every interactive shell

- **SHELL-1** (bug, severe) — `shellrc/_sub_tools.sh:61-68`: Homebrew PATH guard checks for substring `:/homebrew/bin:` but the path actually added is `/opt/homebrew/bin` — guard can never match (typo missing `/opt`), so brew paths duplicate on every re-source. Worse: it uses bare `return 1` inside a sourced script — if the guard ever did match, it would abort sourcing the rest of the file, silently skipping mise/nvm/yarn/deno/bun/java/rust/docker/gcloud setup. Fix the substring AND replace `return` with just skipping the `export PATH=...` line.
- **SHELL-2** (bug) — `bin/git--pro.sh:3`: condition is inverted, `if [ -n "$COMPANY_DOMAIN" ]` prints "(No COMPANY_DOMAIN...)" when it IS set, and sets identity using an empty `$COMPANY_DOMAIN` when it's NOT set. Should be `-z`.
- **SHELL-3** (bug) — `shellrc/_01paths.sh:9`: first PATH entry (2-shell/bin) is prepended unconditionally, before `pathDoesntContain` is even defined (line 11). Every re-source duplicates it.
- **SHELL-4** (bug) — `bin/git--pro.sh:6-7,9-10`: unquoted, deprecated backticks: `` `whoami`@$COMPANY_DOMAIN ``. Breaks with unusual values; should be `"$(whoami)@$COMPANY_DOMAIN"`.
- **SHELL-5** (bug) — `bin/gitc.sh:128-129,141,161`: unquoted `$PARENT_DIR`/`$TARGET_DIR` in `mkdir`/`pushd`; breaks if `$HOME` or repo name contains spaces.
- **SHELL-6** (bug/security) — `bin/gitc.sh:47-59`: `case` uses loose `*offirmo )` style globs; matches unintended substrings (e.g. "notoffirmo", "xoffirmo-graveyard"), silently switching SSH key/identity for the wrong org.
- **SHELL-7** (portability) — `shellrc/_sub_tools.sh:104-116`: `mise activate bash --shims` hardcoded to bash even though file explicitly supports zsh; zsh users don't get proper mise shell hooks.
- **SHELL-8** (portability) — `shellrc/_sub_tools.sh:82-90,133-136,219-221`: bash-completion blocks gated on `"$SHELL" = "/bin/bash"`, missing non-standard bash paths (e.g. Homebrew bash) and no zsh completion equivalent (acknowledged by a TODO comment).
- **SHELL-9** (bug) — `shellrc/_sub_tools.sh:72`: `BREW_USER=$(stat -f "%Su" $(which brew))` runs unconditionally before the `command -v brew` check on line 75; on a Mac without brew this throws a `stat` error every shell start, and `$(which brew)` is unquoted.
- **SHELL-10** (style/security) — `shellrc/_aliases--tools.sh:41`: `gac` alias bakes in `git commit --no-verify`, bypassing hooks by default.
- **SHELL-11** (consistency) — `shellrc/_aliases--projects.sh:27`: calls `source_files_from_dir`, only defined in `bin/load_shellrc.sh`; hidden cross-file coupling that breaks if load order changes.
- **SHELL-12** (security) — same line: sources arbitrary `*.sh` from `$OFFIRMO_MONOREPO_ROOT/.../bin` on every shell start with no integrity check.
- **SHELL-13** (dead code) — `bin/user--update.sh:78-95` (commented nvm curl-install block), `shellrc/_aliases--tools.sh:21-25,46-47,53-59` (stale alternate alias history), `bin/user--clean.sh:142` (hardcoded personal VM path comment) — accumulated cruft, worth pruning.
- **SHELL-14** (polish) — `shellrc/README.md:3`: unresolved "TODO silence output if needed", and no actual doc of load order/idempotency convention.
- **SHELL-15** (minor) — `shellrc/_00settings.sh:36`: zsh branch sets a global `DO_NOTHING=1` that leaks into every zsh session's env for no purpose.
- **SHELL-16** (consistency) — `bin/gitc.sh:29-40,119-125`: unconditional debug `echo` block on every invocation, unlike shellrc files which respect `VERBOSE__RC`.

## 3-settings/ (109 files) — mostly config/binaries, lighter on bugs

- **SET-1** (privacy leak, real) — `3-tools/git/notes--per-repo-explicit-config.md` hardcodes the personal email `offirmo.net@gmail.com` in example commands. Given repo is Unlicense/public, this permanently doxxes the address in git history. Suggest replacing with a placeholder like `<your-email>@example.com`.
- **SET-2** (dead/empty file, low risk but odd) — `.../uMatrix/~~gen/generator/20-specific-sites/private-do-not-merge.mjs` is checked into git despite the filename screaming "do not merge" — currently empty, so no live leak today, but the filename + tracked status is a footgun for a future accidental commit of private domain rules. Suggest gitignoring it or documenting that it must stay empty in the tracked version.
- **SET-3** (duplication) — `X-tosort/` (109-file staging area) duplicates the root-level `tosort/` folder concept. No README explains the distinction. Suggest merging into one staging convention or adding a one-line note.
- **SET-4** (org cruft) — `3-tools/sizeup/` contains only a screenshot PNG, no actual config. `1-provisioning/macos/user--200ensure--installed--daily-life-utils.sh:37` has `## TODO find alternative to sizeup which is intel` — SizeUp is being phased out (Intel-only). Low value, consider removing.
- **SET-5** (dead config, needs confirmation) — `3-tools/webstorm/` is not referenced anywhere in `1-provisioning/` except a commented-out line. `X-tosort/WebStorm2019.2/` is a very old version-pinned IDE settings dump, likely superseded. Worth confirming still in active use or archiving.
- **SET-6** (unclear provenance/possible license risk) — `1-oses/macOS/keyboard--bépo/` contains 3 near-duplicate copies of the same third-party keyboard bundle (plus a `.zip`), all binary assets from bepo.fr, not authored by the repo owner. Vendoring third-party binary bundles into an Unlicense repo is questionable — the Unlicense declaration would misleadingly imply the repo owner can grant rights to redistribute this. Suggest keeping only the final chosen variant and noting the original source/license.
- **SET-7** (readability) — `1-oses/macOS/keyboard--bépo/README.md` is terse personal notes (mixed French/English); an outside reader can't tell which of the 3 bundle variants to install. Suggest a one-line "use this one: X" pointer.
- **SET-8** (job-search domains in public repo, informational) — `webextensions--common/uMatrix/~~gen/generator/01-matrix-off/index.mjs` includes an `ALLOWLIST__JOB_SEARCH_DOMAINS` block plus `ALLOWLIST__REGULATED` (a specific bank + equity-plan platform) — reveals employer/financial relationships by inference if published. No code change needed, just a heads-up.

No secrets/tokens/API keys found in any tracked file. `.DS_Store` files exist on disk but are NOT tracked (confirmed via `git ls-files`; ignored via global `~/.config/git/ignore`).

## 4-misc/, tosort/, root files

- **MISC-1** (bug) — `package.json` (all 9 scripts) reference `./provisioning/...` but the actual folder is `1-provisioning/`. Every npm script is broken (same root cause as PROV-1). README instead documents direct `bash 1-provisioning/...sh` invocations, so package.json looks like stale config from before the folder was renamed/numbered.
- **MISC-2** (dead code) — `tosort/2023/common/superuser--ensure--present--work_structure.sh`, `tosort/2023/macos/superuser--ensure--settings_improved.sh` are near-duplicates of current `1-provisioning/` scripts, clearly superseded. `tosort/2023/common/user--ensure--installed--dev-env--ruby.sh` is dead (starts with `exit 1` before the actual rvm install). `tosort/2023/windows/user_change_settings.sh` has no counterpart and looks abandoned. Recommend deleting the whole `tosort/2023/` tree.
- **MISC-3** (security) — `4-misc/agents/settings.json`: `deny` blocks `Read(.env*|*.pem|*.key)`, but `allow` includes `Bash(cat *)` and `Bash(find *)` with no path restriction. The Read-tool deny doesn't stop `cat .env` via the allowed Bash pattern — the secret protection is illusory as configured.
- **MISC-4** (security posture) — same file: `"defaultMode": "auto"` + `"skipDangerousModePermissionPrompt": true` combined with a broad unscoped `Bash(pnpm *)` allow is a very permissive posture for a settings.json sitting in a public open-source repo. Worth a comment noting it's intentionally loose, or tightening it.
- **MISC-5** (dangling reference) — same file, `PostToolUse` hook command `.agents/hooks/post-edit-formatter.sh` does not exist anywhere in this repo. Broken hook reference.
- **MISC-6** (hygiene) — no `.gitignore` anywhere in the repo. Untracked `.idea/` is currently only excluded by manual git hygiene; `.DS_Store` files exist untracked in several folders — none currently tracked, but a stray `git add .` would commit all of them. Recommend adding a root `.gitignore` (`.idea/`, `.DS_Store`, etc.).
- **MISC-7** (low-priority duplication) — `tosort/2025/workspace.code-workspace` vs `4-misc/vscode-workspace-offirmo/offirmo2024.code-workspace` — two different code-workspace files serving the same purpose, never consolidated.
- **MISC-8** (informational, not actionable) — `tosort/2023/snapshot/.npmrc` contains `offirmo.net@gmail.com` — same email already published in this repo's own README.md, so no new leak. `.gitconfig` in the same snapshot already has its path anonymized to `/Users/xxx/...`.
- **MISC-9** (non-issue, confirmed correct) — `0-prerequisites/hello.sh` is explicitly labeled "DEMO ... FOR TEST PURPOSE" and matches README's "Test" section curl-pipe entrypoints exactly — intentional smoke test, not a broken/misleading real bootstrap script.

Nothing else notable in `4-misc/agents/CLAUDE.md` or `notes.md` beyond MISC-3/4/5 — no secrets, no prompt-injection content.

## Summary

~64 findings across 4 areas. No secrets, unsafe eval, or command-injection vectors anywhere. Top-priority fixes:

1. **PROV-1 / MISC-1** — fix or delete the broken `package.json` npm scripts (wrong path).
2. **PROV-3/4/5** — SSH key provisioning bugs (`~` not expanding, dead branch, fragile chmod).
3. **PROV-7** — typo'd duplicate `export` written into every user's `~/.bashrc`.
4. **SHELL-1** — broken Homebrew PATH guard that can silently abort shellrc sourcing.
5. **SHELL-2** — inverted condition in `git--pro.sh` sets wrong git identity.
6. **MISC-3/MISC-5** — `4-misc/agents/settings.json` has an illusory secret-read protection and a dangling hook reference.
7. **SET-1** — hardcoded personal email in a public-repo doc.
8. **MISC-6** — add a root `.gitignore`.
9. **MISC-2** — delete the superseded `tosort/2023/` tree.
