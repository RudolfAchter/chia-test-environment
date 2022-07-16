#!/bin/bash
NODE="chia-full01"
SSHPUBKEY=`cat ~/.ssh/id_rsa.pub`
sudo lxc exec $NODE -- /bin/bash -c 'apt install -y openssh-server'
sudo lxc exec $NODE -- /bin/bash -c 'useradd -m -G sudo -s /bin/bash ansible'
sudo lxc exec $NODE -- /bin/bash -c 'echo ansible:chiatest | chpasswd'
sudo lxc exec $NODE -- /bin/bash -c 'mkdir /home/ansible/.ssh'
sudo lxc exec $NODE -- /bin/bash -c "echo $SSHPUBKEY > /home/ansible/.ssh/authorized_keys"
sudo lxc exec $NODE -- /bin/bash -c 'chown ansible:ansible /home/ansible/.ssh'
sudo lxc exec $NODE -- /bin/bash -c 'chown ansible:ansible /home/ansible/.ssh/authorized_keys'
sudo lxc exec $NODE -- /bin/bash -c 'chmod 600 /home/ansible/.ssh/authorized_keys'

