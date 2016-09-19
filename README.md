## Virtualized Open Source Development Environment

Bootstrap shell scripts for provisioning my personal dev box. Targeting Ubuntu.


## Test
Check that bootstrap will work with:
```
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/hello.sh | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/hello.sh | sudo bash
```


## Install
```
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_setup_apt.sh      | sudo bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_install_base.sh   | sudo bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_work_structure.sh | sudo bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_install_dev.sh    | sudo bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_cleanup.sh        | sudo bash

curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_work_structure.sh  | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_install.sh         | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_clone.sh           | bash
```


## Maintain
```
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_cleanup.sh | sudo bash
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
echo "hello from .profile"
echo "hello from .bashrc"
echo "hello from .bash_profile"
echo "hello from .bash_logout"
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
doesn’t 

## Tosort

````
ssh sam@192.168.88.10

gitc git@github.com:Offirmo/web-tech-experiments.git
```
