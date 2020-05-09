#/bin/sh

# install some tools
sudo yum install -y git vim gcc kernel-devel glibc-static telnet bridge-utils net-tools

sudo yum update -y

# install docker
sudo curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# start docker service
sudo groupadd docker
sudo gpasswd -a vagrant docker
sudo systemctl start docker

sudo rm -rf get-docker.sh

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
