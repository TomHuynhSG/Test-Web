## On EC2 Instance for Ansible Server
Assuming that you have launched the instance from the CloudFormation YAML file
***On root user `sudo su -`:***
```bash
rm -f /etc/ansible/hosts
touch /etc/ansible/hosts
echo "
[dockerserver]
[<docker_server_private_ip_address>]
" >> /etc/ansible/hosts
```
***On ansibleadmin user `sudo su - ansibleadmin`:***
```bash
ssh-keygen -t ed25519 -C "dolelongan@gmail.com" -f ~/.ssh/id_ed25519 -N ""
```
```bash
ssh-copy-id [<docker_server_private_ip_address>]
```
- Make sure that ansiblePlaybook.yml is on the `~` directory
```bash
ansible-playbook ansiblePlaybook.yml
```


