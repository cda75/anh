#!/bin/sh
useradd -m -d /home/dimka -s /bin/bash dimka
# echo "dimka:merlin" | chpasswd
usermod -aG sudo dimka
mkdir -p /home/dimka/.ssh
cat ansible_key.pub > /home/dimka/.ssh/authorized_keys
echo "dimka ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R dimka:dimka /home/dimka
chmod 700 /home/dimka/.ssh/
chmod 600 /home/dimka/.ssh/authorized_keys
echo "AuthorizedKeysFile      %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config
service sshd restart
cd ../
rm -rf ansible-host/
