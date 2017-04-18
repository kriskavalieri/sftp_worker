#!/bin/bash
mkdir -p /data
echo 'root:1234' | chpasswd
mkdir -p /etc/ssh/
echo -e "\nChallengeResponseAuthentication no\nPasswordAuthentication yes\nPermitEmptyPasswords yes\nPermitRootLogin yes" >> /etc/ssh/sshd_config
/usr/sbin/sshd  -f /etc/ssh/sshd_config
echo "Starting nginx in non daemon mode:"
nginx -c /var/nginx.conf
echo "Ready!"
