NODE="chia-full01"
SSHPUBKEY=`cat ~/.ssh/id_rsa.pub`
lxc exec $NODE – /bin/bash -c "apt install -y openssh-server"
lxc exec $NODE – /bin/bash -c "useradd -m -G sudo -s /bin/bash ansible"
lxc exec $NODE – /bin/bash -c "mkdir /home/ansible/.ssh"
lxc exec $NODE – /bin/bash -c "echo $SSHPUBKEY > /home/ansible/.ssh/authorized_keys"
lxc exec $NODE – /bin/bash -c "chown ansible:ansible /home/ansible/.ssh/authorized_keys"
lxc exec $NODE – /bin/bash -c "chmod 600 /home/ansible/.ssh/authorized_keys"

