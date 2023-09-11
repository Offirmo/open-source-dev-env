## Open Source Development Environment

Bootstrap shell scripts for provisioning my personal dev box. Targeting Ubuntu or macOS.

See also:
* https://github.com/Offirmo-team/wiki/wiki/macOS
* https://github.com/Offirmo-team/wiki/wiki/dev-env


## Test

Check that bootstrap will work with:

```
[if ubuntu] sudo apt-get install curl
curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/hello.sh | bash
curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/hello.sh | sudo bash
```


## Install

### macOS

Set bash as default: (cf. <https://www.cyberciti.biz/faq/change-default-shell-to-bash-on-macos-catalina/>)
```
cat /etc/shells  <-- check if /bin/bash is present
echo $SHELL , $0 , $BASH  <-- check current shell
chsh -s /bin/bash
```

Show hidden files:
* temp: <https://apple.stackexchange.com/a/340543>
  * `Apple + shift + .`
* définitif: (see [provisioning file](./provisioning/macos/user--100ensure--settings.sh))

Install git: either:
- type `git` and accept everything asked
- or/and `xcode-select --install` (recommended)
- or/and install xcode and launch it once (but takes time & lot of disk space!)

Install
```
curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/provisioning/common/user--000ensure--present--work_structure.sh   |      bash
         then remove `src` from the spotlight search: "Spotlight privacy"
curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/provisioning/common/user--010ensure--settings--shell.sh           |      bash


IF WANTED copy your keys from previous machine here.
If not found, some will be generated:
   curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/provisioning/common/user--020ensure--present--ssh_keys.sh      | bash
   + if new, add the new keys to github
      - go here: https://github.com/settings/keys
        cat ~/.ssh/id_ed25519_offirmo.pub | pbcopy
        cat ~/.ssh/id_ed25519.pub | pbcopy
+ test it: `ssh -T git@github.com`
+ DELETE SSH KEYS FROM THE DISK/USB KEY!


curl -o- https://raw.githubusercontent.com/Offirmo/open-source-dev-env/master/provisioning/macos/user--099ensure--installed--first.sh           |      bash

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
echo "* hello from: .profile"
echo "* hello from: .bashrc"
echo "* hello from: .bash_profile"
echo "* hello from: .bash_logout"
```

### Manual installs
https://www.jetbrains.com/toolbox/app/

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

### Useful commands
```
git stash --include-untracked
git stash save -u ""
git rebase -i master
```

### Useful unicode chars ’☑☐✓❌

### Useful npm modules
* https://github.com/jonathaneunice/iterm2-tab-set

### dual ssh keys
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
   IdentityFile ~/.ssh/id_ed25519
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
