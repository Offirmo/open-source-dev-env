# Per-repo GitHub auth override (Offirmo account, HTTPS + PAT)

Problem this solves: your global `~/.gitconfig` / macOS Keychain authenticates
as a different GitHub account. For personal repos owned by `Offirmo`, you
need a different identity and a different credential — without touching
global config, and without SSH (some network blocks the SSH protocol
even over port 443, so HTTPS + PAT is the only reliable path).

## Symptoms that point here

- `git push` fails with `Permission to Offirmo/<repo>.git denied to <your-org-account>` (403)
- SSH push/fetch hangs then fails with `Connection closed by ... port 443` /
  `Connection timed out during banner exchange` (network blocks SSH, even
  tunneled over 443 — not a key/config problem)

## Setup steps

1. **Remote must be HTTPS**, pointing at the Offirmo repo:
   ```bash
   git remote set-url origin https://github.com/Offirmo/<repo>.git
   ```

2. **Set repo-local identity** (local config wins over global, scoped to this repo only):
   ```bash
   git config --local user.name "Offirmo"
   git config --local user.email "offirmo.net@gmail.com"
   ```

3. **Generate a PAT** on GitHub, logged into the **Offirmo** account (check the
   avatar in the top-right first):
   - https://github.com/settings/tokens → fine-grained token
   - Scope to the specific repo
   - Permissions needed for push/pull: **Contents: Read and write**
     (Metadata: Read-only is mandatory/auto-included). Leave everything else
     (Actions, Administration, Secrets, Webhooks, etc.) as No access.
   - Copy the token immediately — shown once.

4. **Point the repo at a repo-local credential file**, bypassing the global
   `osxkeychain` helper (which would otherwise answer first and hand git your
   global config account token):
   ```bash
   git config --local --unset-all credential.helper
   git config --local --add credential.helper ""
   git config --local --add credential.helper "store --file=.git/credentials-offirmo"
   ```
   The empty string entry resets the inherited helper chain (clears
   `osxkeychain` for this repo specifically); the `store` entry then becomes
   the only active helper here. Global git config and Keychain are untouched.

5. **Write the PAT into that file** (run yourself — don't paste secrets into
   a chat transcript):
   ```bash
   echo "https://Offirmo:<PASTE_PAT_HERE>@github.com" > .git/credentials-offirmo
   chmod 600 .git/credentials-offirmo
   ```
   `.git/credentials-offirmo` lives inside `.git/`, so it's never tracked or
   pushed.

6. **Verify**:
   ```bash
   git fetch origin              # pull check
   git push --dry-run origin main   # push check, no side effects
   ```
   Both should succeed with no 403.

## Gotchas encountered

- **Credential helpers are cumulative, not overriding.** Setting a new
  `credential.helper` value with `git config --local` *adds* to the list
  inherited from global config — it doesn't replace it. `osxkeychain` (from
  global config) still runs first unless explicitly cleared with an empty
  string entry (step 4).
- **`core.sshcommand` pointing at a dedicated SSH key is a trap if the remote
  URL is HTTPS** — it's dead config, silently ignored, and easy to mistake
  for "SSH auth is already set up here."
- **SSH over port 443 (`ssh.github.com:443`) can still be blocked** by
  network-level protocol inspection even when the raw TCP port is reachable
  (`nc -z` succeeds but the SSH banner exchange itself times out). If you see
  that pattern, stop debugging SSH and switch to HTTPS + PAT.
- ***HTTPS 403*** can happen if the PAT is too fine-grained =
  check if the target repo is included in the PAT
- If a repo was recreated from a downloaded zip + `git init` (instead of
  `git clone`), local history is completely unrelated to the real GitHub
  history and `branch.<name>.remote` / `branch.<name>.merge` tracking config
  is missing (`git pull` errors with "no tracking information"). Fix:
  ```bash
  git branch --set-upstream-to=origin/<default-branch> <local-branch>
  ```
  To discard the fake local history and match the real repo (only after
  backing up / stashing any real local changes with `git stash push -u`):
  ```bash
  git fetch origin
  git reset --hard origin/<default-branch>
  git clean -fd
  ```


## fixing wrong author

On the last commit
```bash
git config user.name "Correct Name"
git config user.email "correct-email@example.com"

git commit --amend --reset-author --no-edit
```

Check
```bash
git log --format=fuller
```
