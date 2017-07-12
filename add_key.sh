#!/bin/sh
username="dimka"
useradd -m -d /home/$username -s /bin/bash $username
usermod -aG sudo $username
mkdir -p /home/$username/.ssh
cat ansible_key.pub >> /home/$username/.ssh/authorized_keys
echo $username 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
chown -R $username:$username /home/$username
chmod 700 /home/$username/.ssh/
chmod 600 /home/$username/.ssh/authorized_keys
echo "AuthorizedKeysFile      %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config
service sshd restart
cd ../
rm -rf anh/
