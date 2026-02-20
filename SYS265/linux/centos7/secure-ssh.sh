#!/bin/bash

sudo useradd -m -d /home/$1 -s /bin/bash $1
sudo passwd -d $1

sudo mkdir  /home/$1/.ssh

#add public key locally
sudo cp /home/nicole/Tech-Journal-NicoleAmaral/SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys

#Perms
#set owner to new user, not root
sudo chown -R $1:$1 /home/$1/.ssh
#rwx only for new user
sudo chmod 700 /home/$1/.ssh
# rw only for new user
sudo chmod 600 /home/$1/.ssh/authorized_keys

#Disable root ssh
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo systemctl restart ssh

