#! /bin/bash

############ post install cleanups ############

## fix possible unmet dependencies
sudo apt-get install --fix-broken

## Note: if caught in a loop, use
## sudo dpkg --purge
## http://askubuntu.com/questions/337456/boot-100-and-cant-purge

sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove --purge
