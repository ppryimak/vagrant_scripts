#!/usr/bin/env bash

echo "Installing Java"
add-apt-repository -y ppa:linuxuprising/java
apt update
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt install -y oracle-java10-installer
apt install oracle-java10-set-default
echo "SETTING JAVA HOME"
echo "export JAVA_HOME=/urr/bin" >> /home/vagrant/.bashrc
echo "JAVA installad"
java --version

echo "Installing maven"
apt-get install -y maven
echo "Maven installed"
mvn --version

echo "Installing git"
apt-get install -y git
echo "Git installed"
git --version

# install IntelliJ
echo "Installing idea"
if [ ! -d "/usr/local/idea/idea-IC-181.5087.20" ]; then
 cd /usr/local/
 mkdir idea
 cd idea
 wget -O /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIC-2018.1.4-no-jdk.tar.gz 
 tar xfz /tmp/intellij.tar.gz
 echo "Idea installed"
else
 echo "Idea has been installed already"
fi

echo "Installing curl"
apt-get install -y curl

echo "Installing docker"
if [ -x "$(command -v docker)" ]; then
    echo "Has been installed already"
else
    cd /usr/local
    mkdir docker
    cd docker
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh
    #sudo usermod -aG docker your-user
    echo "Docker installed"
fi
docker --version

