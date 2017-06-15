#!/bin/sh
useradd dimka -d /home/dimka -s /bin/bash -m 
echo "dimka:merlin" | chpasswd
usermod -aG sudo dimka

