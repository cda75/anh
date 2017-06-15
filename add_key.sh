#!/bin/sh
useradd -m -d /home/dimka -s /bin/bash dimka
echo "dimka:merlin" | chpasswd
usermod -aG sudo dimka
mv ansible_key.pub /home/dimka/key
chmod 777 /home/dimka/key
su - dimka
mkdir -p .ssh
chmod 700 .ssh
cat key > authorized_keys
rm -f /home/dimka/key
chmod 600 .ssh/authorized_keys

