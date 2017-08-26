echo "==============="
echo "BEGIN PROVISION"
echo "==============="

# standalone installs
apt-get -y update
apt-get -y upgrade
apt-get -y install curl
apt-get -y install git
apt-get -y install zsh
