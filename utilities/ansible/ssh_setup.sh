#!/bin/bash

########## SSH Setup ##########

# On ansibleadminn user, run:
ssh-keygen -t ed25519 -C "dolelongan@gmail.com" -f ~/.ssh/id_ed25519 -N ""
# sshpass -p 'ansibleadmin' ssh-copy-id -o StrictHostKeyChecking=no ansibleadmin@[<docker_server_ip_address>]