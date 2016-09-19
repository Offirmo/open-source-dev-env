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
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/superuser_cleanup.sh        | sudo bash

curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_change_settings.sh | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_work_structure.sh  | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/provisioning/user_install.sh         | bash
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
https://github.com/Offirmo-team/wiki/wiki/partage-samba
```
sudo smbpasswd -a sam
sudo gedit /etc/samba/smb.conf
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

## https://confluence.jetbrains.com/display/IDEADEV/JetBrains+Runtime+Environment
## https://bintray.com/jetbrains/intellij-jdk/openjdk8-linux-x64
curl -L "https://dl.bintray.com/jetbrains/intellij-jdk/jbsdk8u112b340_linux_x64.tar.gz" -o ~/work/install/jbsdk8u112b340_linux_x64.tar.gz
cd ~/work/install/; mkdir jbsdk8u112b340_linux_x64; tar -xzf jbsdk8u112b340_linux_x64.tar.gz -C jbsdk8u112b340_linux_x64

cd ~/work/src && git clone git@github.com:Offirmo/virtualized-open-source-dev-env.git

echo "source $HOME/work/src/virtualized-open-source-dev-env/shellrc/bashrc.sh" >> ~/.bashrc
```
