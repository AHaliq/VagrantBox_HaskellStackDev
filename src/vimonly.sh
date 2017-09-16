sudo apt-get -yqq update
sudo apt-get -yqq install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
sudo apt-get -yqq install curl git
sudo git clone https://github.com/AHaliq/ConfigFiles.git ~/.ConfigFiles
sudo sh ~/.ConfigFiles/install.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo find ~/.vim -type d -exec chmod 755 {} \;

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.2/config --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
cd ~/vim
sudo make install
cd ~
sudo rm -rf ~/vim

echo PATH="\$PATH:~/.local/bin:/usr/local/bin" >> ~/.profile
. ~/.profile
