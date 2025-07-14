## Open Source Development Environment

Bootstrap shell scripts for provisioning my personal dev box. Targeting Ubuntu or macOS.

See also:
* https://github.com/Offirmo-team/wiki/wiki/macOS
* https://github.com/Offirmo-team/wiki/wiki/dev-env

2024-11-18 20:25

## Test

Check that bootstrap will work with:

1. if Ubuntu: `sudo apt-get install curl`
2. user mode: `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/0-prerequisites/hello.sh | bash`
3. admin mode: `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/0-prerequisites/hello.sh | sudo bash`

## Install

### macOS pre-req

First, set bash as default: (cf. <https://www.cyberciti.biz/faq/change-default-shell-to-bash-on-macos-catalina/>)
1. `cat /etc/shells` <-- check if /bin/bash is present:
2. `echo $SHELL , $0 , $BASH` <-- check current shell
3. `chsh -s /bin/bash` <-- switch if needed
4. IF NEEDED `chsh -s /bin/zsh` (switch back)```

Then install git: either:
- type `git` and accept everything asked
- or/and `xcode-select --install`
- or/and install xcode and launch it once (but takes time & a lot of disk space!)

### 000 = bootstrap

1. `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning/common/user--000ensure--present--work_structure.sh | bash`
   1. then remove `src` from the spotlight search: "Spotlight privacy"
2. `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning/common/user--010ensure--settings--shell.sh | bash`
3. Settings: in `~/.profile`:
```
#export PERSONAL_USERNAME__GITHUB=Xyz
#export COMPANY="foo"
#export COMPANY_DOMAIN="$COMPANY.com"
```
4. Keys:
   1. IF WANTED copy your keys from previous machine here
   2. Set `export PERSONAL_USERNAME__GITHUB=Xyz`
   3. `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning/common/user--020ensure--present--ssh.sh | bash`
   4. if new, add the new keys to github
      * go here: https://github.com/settings/keys
      * `cat ~/.ssh/id_ed25519_offirmo.pub | pbcopy`
      * `cat ~/.ssh/id_ed25519_xyz.pub | pbcopy`
   5. test it: `ssh -T git@offirmo.github.com`
   6. DELETE SSH KEYS FROM THE DISK/USB KEY!
4. `curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/1-provisioning/macos/user--099ensure--installed--first.sh | bash`

### 100 = base install post-bootstrap, from local

```bash
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--100ensure--settings.sh
```

### 200 = ordinary most necessary tools

```bash
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--200ensure--installed--daily-life-utils.sh
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--201ensure--installed--fonts.sh
```

### 300 = dev env

```bash
bash ~/work/src/off/open-source-dev-env/1-provisioning/common/user--300ensure--installed--dev-env--common.sh
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--301ensure--installed--dev-env--tools.sh
bash ~/work/src/off/open-source-dev-env/1-provisioning/common/user--310ensure--installed--dev-env--js.sh
bash ~/work/src/off/open-source-dev-env/1-provisioning/common/user--399ensure--cloned--common_offirmo_repos.sh
```

### 400 = creator
```bash
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--400ensure--installed--tools.sh
```

### 900 = gaming
```bash
bash ~/work/src/off/open-source-dev-env/1-provisioning/macos/user--900ensure--installed--gaming.sh
```

### Ubuntu
(no longer using)

### common
Edit and check the bash config files


## Maintain

### macos

```bash
user--update.sh
user--clean.sh
```

### Cleanup git repo:

```bash
git remote prune origin
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
git gc
```

### If missing, add a debug line to shellrc existing files
```bash
[ "$VERBOSE__RC" == true ] && echo "* [~/.profile] hello!"
```

### Manual installs
https://www.jetbrains.com/toolbox/app/


Show hidden files:
* temp: <https://apple.stackexchange.com/a/340543>
	* `Apple + shift + .`
* définitif: (see [provisioning file](./1-provisioning/macos/user--100ensure--settings.sh))
*
### Load settings
* WebStorm: File -> Import settings... -> folder "install/intellij-colors-solarized"
* iTerm (macOs) -> Prefs -> Profiles -> Colors -> color preset -> "ode/misc/iterm2"
* Terminal (macOs) -> Shell -> import -> "install/solarized"
* xcode -> Preferences -> Locations -> Command line tools  https://stackoverflow.com/a/36726612

### (if needed) Setup the Windows share
* https://www.digitalcitizen.life/how-access-ubuntu-shared-folders-windows-7
```
sudo smbpasswd -a sam
sudo gedit /etc/samba/smb.conf
```
* https://github.com/Offirmo-team/wiki/wiki/partage-samba

### login to npm (?)
```
npm adduser
```



## Notes

https://youtrack.jetbrains.com/articles/IDEA-A-19/Shell-Environment-Loading
```bash
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
	...
fi
```

Also TODO compatibility with non-interactive shells, need no output

### Useful unicode chars ’☑☐✓❌

### Useful npm modules
* https://github.com/jonathaneunice/iterm2-tab-set

### multi ssh keys with NO default
https://github.com/Offirmo-team/wiki/wiki/git
In `.ssh/config`:

```
Host offirmo.github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_ed25519_offirmo
   IdentitiesOnly yes

Host xyz.github.com
   HostName xyz.github.com
   User git
   IdentityFile ~/.ssh/id_ed25519_xyz
   IdentitiesOnly yes
```

In git configs:
```
[remote "origin"]
	url = git@offirmo.github.com:Offirmo/offirmo-monorepo.git
	fetch = +refs/heads/*:refs/remotes/origin/*

[user]
	email = offirmo.net@gmail.com
	name = Offirmo
[github]
	user = Offirmo


XXXAlready in root gitconfig:
[color]
	ui = auto
[push]
	default = simple
```

Test GitHub SSH: https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
```bash
ssh -T git@github.com
```
