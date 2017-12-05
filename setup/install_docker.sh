apt update
apt-get dist-upgrade -y
apt-get install apt-transport-https ca-certificates -y

sh -c "echo deb https://apt.dockerproject.org/repo debian-stretch main > /etc/apt/sources.list.d/docker.list"
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt update
apt-cache policy docker-engine
apt install docker-engine -y

groupadd docker
gpasswd -a $USER docker
service docker restart

docker run hello-world
