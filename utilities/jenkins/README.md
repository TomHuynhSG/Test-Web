# Selenium, AWS, Python, Jenkins, Git Integration

### Initial EC2 Installation on AWS
```
sudo yum update
sudo yum upgrade -y
```

### Install Google Chrome Binary for Linux
```
sudo yum install -y liberation-fonts
sudo yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
google-chrome --version
```

### Install ChromeDriver Binary for Linux
```
sudo yum install -y unzip
wget https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip
sudo unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
chromedriver --version
```

### Install Java 11 (will be used by Jenkins)
```
if find / -name "jvm" 2>/dev/null; then
    echo "Installing java-openjdk11..."
    amazon-linux-extras install java-openjdk11 -y
    echo "java-openjdk11 installed successfully."
else
   echo "java-openjdk11 is already installed."
fi
```

### Install Jenkins 
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
yum install fontconfig java-17-openjdk -y
yum install jenkins -y
yum install git -y
# Check if Maven is installed
if command -v mvn &> /dev/null; then
    echo "Maven is already installed."
else
    # Navigate to the /opt directory
    cd /opt
    # Check if Maven archive is already downloaded
    if [ -f apache-maven-3.9.5-bin.tar.gz ]; then
        echo "Maven archive is already downloaded."
    else
        # Download Apache Maven 3.9.5
        wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
    fi
    # Extract the downloaded archive
    tar -xvzf apache-maven-3.9.5-bin.tar.gz 
    # Rename the extracted directory to 'maven'
    mv apache-maven-3.9.5 maven
    echo "Maven is now installed and configured."
fi
# Define the file path for .bash_profile
file_path="$HOME/.bash_profile"
# Check if the lines are already present
if grep -q "M2_HOME=/opt/maven" "$file_path" &&
   grep -q "M2=/opt/maven/bin" "$file_path" &&
   grep -q "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64" "$file_path" &&
   grep -q "PATH=\$PATH:\$HOME/bin:\$JAVA_HOME:\$M2_HOME:\$M2" "$file_path"; then
    echo "The lines are already present in .bash_profile."
else
       # Add or modify lines in the .bash_profile
    echo "# User specific environment and startup programs" >> "$file_path"
    echo "M2_HOME=/opt/maven" >> "$file_path"
    echo "M2=/opt/maven/bin" >> "$file_path"
    echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64" >> "$file_path"
    echo "" >> "$file_path" 
    # Update the PATH variable in .bash_profile
    echo "PATH=\$PATH:\$HOME/bin:\$JAVA_HOME:\$M2_HOME:\$M2" >> "$file_path"
    # Export the updated PATH
    echo "export PATH" >> "$file_path"
    echo "PATH variables added to .bash_profile."
    # Source the .bash_profile to apply changes immediately   
fi

file_path="$HOME/.bash_profile"
source "$file_path"
# Verify Maven installation by displaying its version
mvn -v
service jenkins start
cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Check Python3 version
```
python3 --version
```

### If Python3 is not installed
```

```

### Check pip3 package manager
```
pip3 --version 
```

### Install virtualenv using pip3
```
sudo pip3 install virtualenv 
virtualenv --version
```

### Install Git on EC2 (upgrading Git to the latest version) - (optional)
```
git --version
```

### General Moodle Selenium Script
Setup a proper path, I call my virtualenv dir "venv", and  I've got the virtualenv command installed in /usr/local/bin
```
PATH=${PATH}:/usr/local/bin
if [ ! -d "venv" ]; then
    virtualenv venv
fi
source venv/bin/activate
pip3 install faker
pip3 install selenium
pip3 install pytest
pip3 install urllib3==1.26.8
pip3 install webdriver_manager
```
