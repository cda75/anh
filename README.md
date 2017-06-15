# anh

Simplification that helps prepare new hosts for managing from ansible master host.

Usage:

git clone https://github.com/cda75/anh && cd anh && sudo ./add_key.sh

Then on the master host:

ssh-agent bash
ssh-add ansible_key
ssh-keygen -f "/home/user/.ssh/known_hosts" -R <host_ip>
ssh <host_ip>

Now you can manage your new host from Ansible playbooks


