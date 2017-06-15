#!/bin/sh
useradd -m -d /home/dimka -s /bin/bash dimka
echo "dimka:merlin" | chpasswd
usermod -aG sudo dimka
mv ansible_key.pub /home/dimka/key
chmod 777 /home/dimka/key
mkdir /home/dimka/.ssh
chmod 700 /home/dimka/.ssh/
cat /home/dimka/key > /home/dimka/.ssh/authorized_keys
rm -f /home/dimka/key
chmod 600 /home/dimka/.ssh/authorized_keys
echo "dimka ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R dimka:dimka /home/dimka
sudo service sshd restart
