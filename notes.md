
https://github.com/whohas/whohas


installed brew packages
```bash
## all, sorted by size
## https://gist.github.com/eguven/23d8c9fc78856bd20f65f8bcf03e691b
du -sch $(brew --cellar)/*/* | sed "s|$(brew --cellar)/\([^/]*\)/.*|\1|" | sort -k1h
```


TODO review https://github.com/omlahore/RemoveMacAI


## To review / inspire
* https://github.com/tregagnon/dotfiles
* https://github.com/camwiegert/dotfiles
* ast-grep https://x.com/alxfazio/status/1962801127251915011?s=46
## Tosort

```
command -v nvm
which nvm
arch
uname -a
## https://google.github.io/zx/configuration#prefix
set -euo pipefail;
```

```
-n   String is non-empty
-z   String is empty
-d   Path exists and is a directory
-f   Path exists and is a file
-e   Path exists (any type)
```

https://github.com/rodyager/RWTS-PDFwriter

```
## minimal desktop env
sudo apt-get install -y --no-install-recommends ubuntu-desktop
sudo apt-get install -y python-gtk2

# needed for unity tweak tools
sudo apt-get install -y --no-install-recommends hud overlay-scrollbar unity-webapps-service

## desktop utils
sudo apt-get install -y  p7zip-full p7zip-rar gnome-terminal

## useful to disable some animations etc.
sudo apt-get install -y unity-tweak-tool
```


## To read
https://askubuntu.com/questions/860952/if-the-key-is-not-named-id-rsa-it-does-not-work

Bash
https://stackoverflow.com/questions/229551/string-contains-in-bash
https://stackoverflow.com/questions/2829613/how-do-you-tell-if-a-string-contains-another-string-in-unix-shell-scripting


```bash
# libffi instructions from brew 2021/01
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
```


which -a pnpm
realpath $(which pnpm)


TODO https://specifications.freedesktop.org/basedir/latest/


```bash
TARGET_FILE=~/.bash_profile
LINE="export BASH_SILENCE_DEPRECATION_WARNING=1"
if ! grep -q "${LINE}" "${TARGET_FILE}"; then
	echo "Silencing Bash deprecation warning... ($TARGET_FILE)"
	echo "$LINE" >> $TARGET_FILE
fi
```

TOCHECK https://github.com/jellydn/vscode-fzf-picker#prerequisites


```gpg.conf
no-random-seed-file
require-secmem
use-agent
no-tty
```

```gpg-agent.conf
default-cache-ttl 604800
max-cache-ttl 604800
pinentry-program /opt/homebrew/bin/pinentry-mac
```



### (if needed) Setup the Windows share

* https://www.digitalcitizen.life/how-access-ubuntu-shared-folders-windows-7

```
sudo smbpasswd -a sam
sudo gedit /etc/samba/smb.conf
```

* https://github.com/Offirmo-team/wiki/wiki/partage-samba


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
