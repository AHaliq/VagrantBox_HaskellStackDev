echo "==================="
echo "SETUP HASKELL STACK"
echo "==================="

# stack base
echo PATH="\$PATH:/root/.local/bin" >> /home/vagrant/.profile
. /home/vagrant/.profile
curl -sSL https://get.haskellstack.org/ | sh

echo "**** stack base installed ****"

apt-get -y install pkg-config

echo "**** dependency software installed ****"

# setup for cairo
apt-get -y install libcairo2-dev

# setup for gtk
apt-get -y install gtk2.0

# setup for cairo + gtk
apt-get -y install libpango1.0-dev

echo "**** library software tools installed ****"

pih= '/home/vagrant/postinstallHaskell.sh'

echo " ATTENTION: run sh postinstallHaskell.sh on login"
echo "stack setup" >> pih
echo "stack install hoogle" >> pih
echo "hoogle data" >> pih
echo "echo 'successful postinstall! deleting install script'" >> pih
echo 'rm -- "\$0"' >> pih
