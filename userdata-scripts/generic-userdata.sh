#!/bin/sh
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart
pass=$(perl -e 'print crypt($ARGV[0], "password")' admin)
useradd -m -p "$pass" "admin"
echo "admin    ALL=(ALL)       NOPASSWD:ALL" >> /etc/sudoers