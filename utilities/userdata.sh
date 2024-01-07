#!/bin/bash

echo "sudo su -" >> /home/ec2-user/.bashrc
public_ipv4=$(curl -s http://checkip.amazonaws.com/)

sudo su -

# Install Git
if rpm -q git; then
  echo "git already installed, skipping..."
else
  echo "Installing git..."
  sudo yum install git -y
  git --version
fi

echo '
#!/bin/bash

# Check if assignment-3/ exists
if [ -d "assignment-3" ]; then
    echo "Removing assignment-3/..."
    rm -rf assignment-3/
    echo "assignment-3/ removed."
fi

mkdir assignment-3
cd assignment-3
git clone https://github.com/RMIT-DevOps-Hackathon/COSC2767-RMIT-Store.git

# Install tree command to show the directory tree of the pulled repository
sudo yum install tree -y
tree ~/assignment-3/

# Navigate to the assignment-3 directory
cd ~/assignment-3/COSC2767-RMIT-Store/utilities

# Find all Bash script files and make them executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo "Bash script files in assignment-3 directory made executable."

# Source .bashrc to apply changes
source ~/.bashrc
' >> /root/init_repo.sh

chmod +x /root/init_repo.sh
echo "Installing docker..."
sudo yum install docker -y
# Add group membership for the default ec2-user
# so you can run all docker commands without using the sudo command

# Prepare permission for Docker
sudo usermod -a -G docker ec2-user
# Run subsequent commands in the current shell without using newgrp
(
  # Enable docker service at AMI boot time and start docker service
  sudo systemctl enable --now docker.service
  sudo systemctl start docker.service
  service docker status
)
