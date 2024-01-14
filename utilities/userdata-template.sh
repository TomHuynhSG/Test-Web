#!/bin/bash

echo "sudo su -" >> /home/ec2-user/.bashrc
public_ipv4=$(curl -s http://checkip.amazonaws.com/)

sudo su -

echo "source /root/init_repo.sh" >> /root/.bashrc

echo '
#!/bin/bash

# Check if COSC2767-RMIT-Store/ exists
if [ -d "COSC2767-RMIT-Store" ]; then
    echo "Removing COSC2767-RMIT-Store/..."
    rm -rf COSC2767-RMIT-Store/
    echo "COSC2767-RMIT-Store/ removed."
fi

git clone -b dev https://github.com/RMIT-DevOps-Hackathon/COSC2767-RMIT-Store.git

# Install tree command to show the directory tree of the pulled repository
sudo yum install tree -y
tree ~/COSC2767-RMIT-Store/

# Navigate to the COSC2767-RMIT-Store directory
cd ~/COSC2767-RMIT-Store/utilities

# Find all Bash script files and make them executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo "Bash script files in assignment-3 directory made executable."

' >> /root/init_repo.sh

chmod +x /root/init_repo.sh

# Install Git
sudo yum install git -y