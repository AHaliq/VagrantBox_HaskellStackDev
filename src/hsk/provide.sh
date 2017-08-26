echo "==================="
echo "SETUP HASKELL STACK"
echo "==================="

# stack base
curl -sSL https://get.haskellstack.org/ | sh
echo PATH="\$PATH:/root/local/bin" >> /home/vagrant/.profile
. /home/vagrant/profile

# setup for cairo

# setup for gtk
