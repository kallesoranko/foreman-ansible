#!/bin/bash

# cat /hosts

echo "127.0.0.1" > /tmp/inventory

ansible-playbook /ansible/foreman.yml -i /tmp/inventory -u root

echo >> /var/log/ansible-pull.log
tail -f /var/log/ansible-pull.log
