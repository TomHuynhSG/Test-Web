#!/bin/bash

# Install Docker
if rpm -q docker; then
  echo "docker already installed, skipping..."
else
  echo "Installing docker..."
  sudo yum install docker -y
fi

# Add group membership for the default ec2-user 
# so you can run all docker commands without using the sudo command
sudo usermod -a -G docker ec2-user

# Run subsequent commands in the current shell without using newgrp
(
  # Enable docker service at AMI boot time and start docker service
  sudo systemctl enable --now docker.service
  sudo systemctl start docker.service
  service docker status
)
