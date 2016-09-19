#! /bin/bash

############ post install cleanups ############
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove --purge
