#!/bin/bash

# cat /hosts

# echo "localhost" > /tmp/inventory

ansible-playbook /ansible/foreman.yml -i /hosts -u root

echo >> /var/log/ansible-pull.log
tail -f /var/log/ansible-pull.log
