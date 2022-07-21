#!/bin/bash

#Helper Script to fastly create some nodes

SSHPUBKEY=`cat ~/.ssh/id_rsa.pub`
#Enter Node names here
NODES="chia-full01 chia-wallet01"

for NODE in $NODES
do
    #NODE="chia-full01"
    echo $NODE
    count=`sudo lxc ls --format csv "$NODE" | wc -l`
    if [[ $count -eq 0 ]]; then
        echo create $NODE
        sudo lxc launch images:ubuntu/focal/cloud $NODE
        sudo lxc exec $NODE -- /bin/bash -c 'apt install -y openssh-server'
        sudo lxc exec $NODE -- /bin/bash -c 'useradd -m -G sudo -s /bin/bash ansible'
        sudo lxc exec $NODE -- /bin/bash -c 'echo ansible:chiatest | chpasswd'
        sudo lxc exec $NODE -- /bin/bash -c 'mkdir /home/ansible/.ssh'
        sudo lxc exec $NODE -- /bin/bash -c "echo $SSHPUBKEY > /home/ansible/.ssh/authorized_keys"
        sudo lxc exec $NODE -- /bin/bash -c 'chown ansible:ansible /home/ansible/.ssh'
        sudo lxc exec $NODE -- /bin/bash -c 'chown ansible:ansible /home/ansible/.ssh/authorized_keys'
        sudo lxc exec $NODE -- /bin/bash -c 'chmod 600 /home/ansible/.ssh/authorized_keys'

    fi
done