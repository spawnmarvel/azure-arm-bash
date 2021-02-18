#!/bin/bash
# be root
sudo /bin/su -
# install and remove git
sudo apt install git-all
sudo apt-get remove git-all
sudo apt install git
# list all cmds on the distro
compgen -c