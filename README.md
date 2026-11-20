## Open Source Development Environment

Bootstrap shell scripts for provisioning my personal dev box. Targeting Linux (Ubuntu) and macOS.

See also bit.ly/offirmo--bootstrap

## Concepts

* A .shellrc is a hidden configuration file that automatically executes commands,
  customizes your prompt, defines aliases, and sets environment variables
  every time you open a new terminal session.
  The specific file name depends on your current shell (e.g., ~/.bashrc for Bash or ~/.zshrc for Zsh).
* shell startup = 3 layers:
  * `~/.profile` = this machine/person only (company, usernames…), not versioned
  * `2-shell/_.profile.sh` = shared env vars, strict POSIX sh, sourced by `~/.profile` (login shells): exported = inherited by subshells, scripts and tools
  * `2-shell/shellrc/*.sh` = interactive stuff (aliases, functions, prompt, completions) + PATH, sourced by `~/.bashrc` + `~/.zshrc`: NOT inherited, so re-applied in every interactive shell
* provisioning scripts = `1-provisioning/{common,macos}/user--NNNensure--….sh`
  * run them in numeric order, interleaving `common/` and `macos/`
  * `0NN` = bootstrap, run remotely (`curl … | bash`) until this repo is cloned (`099`), the others are run from the local clone
  * meant to be idempotent = safe to re-run
* `~~tosort/` = archived, not maintained

## Test

Check that bootstrap will work with:

1. if Ubuntu (no sudo if root on a container): `apt update -y && apt install -y sudo curl gpg`
2. user mode: `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/0-prerequisites/hello.sh | bash`
3. admin mode: `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/0-prerequisites/hello.sh | sudo bash`

## Usage

### Ubuntu pre-req

```
apt-get install -y vim nano
```

### macOS pre-req

brew doesn't work well multi-users, but it may be worth it if heavy tests: https://brew.sh/

1. create a `brew-user` macOS user with admin rights and switch to it
1. install git:
   * in a terminal, type `git` and accept everything asked
1. bootstrap the special `brew-user`:
   ```sh
   ODE_RAW=https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning
   curl -o- $ODE_RAW/common/user--000ensure--present--work_structure.sh | bash
   curl -o- $ODE_RAW/common/user--010ensure--settings--shell.sh | bash
   ```
1. install brew
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ## (may need to restart shell here)
   brew update
   ```

### current user pre-req

#### Optional: set bash as default:
cf. <https://www.cyberciti.biz/faq/change-default-shell-to-bash-on-macos-catalina/>

1. `echo $SHELL , $0 , $BASH` or `dscl . -read /Users/$USER UserShell` <-- check current shell
1. `cat /etc/shells` <-- check if /bin/bash is present (highly likely)
1. `chsh -s /bin/bash` <-- switch if needed
1. IF NEEDED switch back `chsh -s /bin/zsh`

#### install git

either:
- type `git` and accept everything asked
- or/and `xcode-select --install` or `apt-get install -y git`
- or/and install xcode and launch it once (but takes time & a lot of disk space!)

### 0NN = bootstrap, remotely

```sh
ODE_RAW=https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning
```

#### 000 = `~/work` structure

1. `curl -o- $ODE_RAW/common/user--000ensure--present--work_structure.sh | bash`
    * creates the XDG dirs (`$XDG_CONFIG_HOME` etc. if set, otherwise `~/.config`…, + `~/.local/bin`) and `~/work/{bin/shellrc,docs,install,src,tmp}`
1. then remove `~/work/src` from the spotlight search: "Spotlight privacy"

#### 010 = shell rc files

1. `curl -o- $ODE_RAW/common/user--010ensure--settings--shell.sh | bash`
   * creates if missing `~/.profile`, `~/.bash_profile`, `~/.bashrc`, `~/.zshenv`, `~/.zprofile`, `~/.zshrc`, `~/work/bin/shellrc/00-init.sh`
   * then ensures their critical lines are present (debug lines…), even in pre-existing files
1. edit the settings in `~/.profile` (all optional):
    ```sh
    #export PERSONAL_USERNAME__GITHUB=Foo      ## (if not Offirmo) 020 will create a dedicated ssh key
    #export COMPANY="foo"                      ## 010 creates company files, 200 installs meetingbar
    #export COMPANY_DOMAIN="$COMPANY.com"      ## work email = $USER@$COMPANY_DOMAIN
    #export COMPANY_USERNAME__GITHUB="xxx-$COMPANY"
    #export COMPANY_ORG1__GITHUB="$COMPANY"
    #export COMPANY_ORG2__GITHUB="$COMPANY-alt"
    ```
1. if `$COMPANY` was set: restart the terminal and RE-RUN 010
  * creates `~/work/bin/git--$COMPANY.sh` + `~/work/bin/shellrc/alias--$COMPANY.sh`

#### 020 = SSH keys

1. (optional) IF WANTED copy your keys from previous machine into `~/.ssh/`
1. `curl -o- $ODE_RAW/common/user--020ensure--present--ssh.sh | bash` creates if missing:
   * `~/.ssh/id_ed25519` = default key
   * `~/.ssh/id_ed25519_offirmo` + `Host offirmo.github.com` in `~/.ssh/config`
   * `~/.ssh/id_ed25519_$PERSONAL_USERNAME__GITHUB` + `Host $PERSONAL_USERNAME__GITHUB.github.com` (if set and not Offirmo)
   * then enforces the `~/.ssh` permissions
1. if new, add the new public keys to GitHub (the script opens https://github.com/settings/keys + Bitbucket)
   * `cat ~/.ssh/id_ed25519_offirmo.pub | pbcopy`
   * `cat ~/.ssh/id_ed25519.pub | pbcopy`
   * `cat ~/.ssh/id_ed25519_xyz.pub | pbcopy`
1. (if used) DELETE SSH KEYS FROM THE DISK/USB KEY!

#### 050 = package manager

1. `curl -o- $ODE_RAW/common/user--050ensure--pkg-mgr.sh | bash`
    * ensures git (macOS: triggers the Xcode Command Line Tools install), brew, wget, gpg, jq, yq
    * ⚠️ installing brew needs sudo: if the current user can't, install it from an admin user (see macOS pre-req)
    * refreshes GitHub's ssh host keys in `~/.ssh/known_hosts`
1. test ssh: `ssh -T git@offirmo.github.com` `ssh -T git@github.com`

#### 099 = clone this repo

1. `curl -o- $ODE_RAW/common/user--099ensure--cloned--ode_repo.sh | bash`
   * clones (https = no ssh key needed) or updates this repo in `~/work/src/x-external/off/offirmo/open-source-dev-env`
   * hooks `2-shell/_.profile.sh` into `~/.profile` = shared env vars
   * hooks `2-shell/bin/load_shellrc.sh` into `~/.bashrc` + `~/.zshrc`
     = sources `2-shell/shellrc/*.sh` then `~/work/bin/shellrc/*.sh`, puts `2-shell/bin` in the PATH
1. restart the terminal

### 1NN+ = from the local clone

```bash
cd ~/work/src/x-external/off/offirmo/open-source-dev-env/1-provisioning
```

#### 100 = base settings

```bash
bash macos/user--100ensure--settings.sh
```

#### 200 = ordinary most necessary tools

```bash
bash macos/user--200ensure--installed--daily-life-utils.sh
bash macos/user--201ensure--installed--fonts.sh
```

#### 300 = dev env

```bash
bash common/user--300ensure--installed--dev-env--common.sh
bash macos/user--301ensure--installed--dev-env--tools.sh
bash common/user--310ensure--installed--dev-env--js.sh
## clones via git@offirmo.github.com = needs the Offirmo ssh key registered on GitHub
bash common/user--399ensure--cloned--common_offirmo_repos.sh
```

#### 400 = creator

```bash
bash macos/user--400ensure--installed--tools.sh
```

#### 900 = gaming

```bash
bash macos/user--900ensure--installed--gaming.sh
```

### Manual installation steps

https://www.jetbrains.com/toolbox/app/

Show hidden files:

* temp: <https://apple.stackexchange.com/a/340543>
    * `Apple + shift + .`
* définitif: (see [provisioning file](./1-provisioning/macos/user--100ensure--settings.sh))


#### Load settings

* WebStorm: File -> Import settings... -> folder "install/intellij-colors-solarized"
* iTerm (macOs) -> Prefs -> Profiles -> Colors -> color preset -> "ode/misc/iterm2"
* Terminal (macOs) -> Shell -> import -> "install/solarized"
* xcode -> Preferences -> Locations -> Command line tools  https://stackoverflow.com/a/36726612

#### login to npm (?)

```
npm adduser
```


## Maintain

```bash
user--update.sh
user--clean.sh
```

### review unused brew pkg

```
brew list --installed-on-request
port installed requested
```

### Cleanup git repo:

```bash
git remote prune origin
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
git gc

## if case issue on `git remote prune origin`
git remote prune --dry-run origin | sed -n 's/^ \* \[would prune\] //p' \
    | while read -r ref; do git update-ref -d "refs/remotes/$ref"; done
```

## Contribute

### Simulate a clean provisioning

```bash
bash "~~snapshot/simulate-provisioning.sh" [MAX_NUMBER]  ## ex. 020 = stop after the 020 scripts
```

* runs the `1-provisioning/` scripts in order with HOME = `~~snapshot/home--macos/` (wiped at each run, asks first)
* commands acting outside HOME (brew, sudo, defaults, ssh-keygen…) are faked, their calls logged in `fake-commands.log`
* the produced files are committed: review the git diff

### If missing, add a debug line to shellrc existing files

```bash
[ "$VERBOSE__RC" == true ] && echo "* [~/.profile] hello!"
```

### review useful brew pkg to add

```
brew list --installed-on-request
port installed requested
```
