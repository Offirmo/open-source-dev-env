## Virtualized Open Source Development Environment

Bootstrap shell scripts for provisioning my personal dev box. Targeting Ubuntu.


## Test
Check that bootstrap will work with:
```
curl -o- http://www.offirmo.net/open-source-dev-env/hello.sh | bash
curl -o- http://www.offirmo.net/open-source-dev-env/hello.sh | sudo bash
```


## Install

Ubuntu

```
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_setup_apt.sh      | sudo bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_install_base.sh   | sudo bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/superuser_work_structure.sh | sudo bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_install_dev.sh    | sudo bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh        | sudo bash

curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/user_work_structure.sh  | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/user_install.sh         | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/user_clone.sh           | bash
```

Mac

```
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/superuser_work_structure.sh | sudo bash

curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/user_work_structure.sh  | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/macos/user_install.sh         | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/macos/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/common/user_clone.sh           | bash
```


## Maintain

Ubuntu

```
curl -o- http://www.offirmo.net/open-source-dev-env/provisioning/ubuntu/superuser_cleanup.sh | sudo bash
```


## manual steps

### Generate a private key and register it to GitHub
https://github.com/settings/keys
```
ssh-keygen -t rsa -b 4096 -C "offirmo.net@gmail.com"
cat ~/.ssh/id_rsa.pub 
```

### Add a debug line to shellrc existing files
```bash
echo "* hello from: .profile"
echo "* hello from: .bashrc"
echo "* hello from: .bash_profile"
echo "* hello from: .bash_logout"
```

### Setup the Windows share
* http://www.digitalcitizen.life/how-access-ubuntu-shared-folders-windows-7
```
sudo smbpasswd -a sam
sudo gedit /etc/samba/smb.conf
```
* https://github.com/Offirmo-team/wiki/wiki/partage-samba

### login to npm
```
npm adduser
```


## Notes

### Useful commands
```
git stash --include-untracked
git stash save -u ""
git rebase -i master
```

### Useful unicode chars ’☑☐✓❌
