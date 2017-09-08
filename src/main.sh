echo "==============="
echo "BEGIN PROVISION"
echo "==============="

tot="6"

echo "[0/$tot] start base; apt-get update"
sudo apt-get -yqq update
sudo apt-get -yqq install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
  python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
echo "[1/$tot] install git, curl, vim and pull config files"
sudo apt-get -yqq install curl git
sudo git clone https://github.com/AHaliq/ConfigFiles.git ~/.ConfigFiles
sudo sh ~/.ConfigFiles/install.sh

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
cd ~/vim
sudo make install

# VIM SETUP -------------------------------------

echo "[2/$tot] install vim plugins"
# Pathogen
sudo mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
sudo curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Plugins
cd /home/vagrant/.vim/bundle
  # File Management
sudo git clone https://github.com/scrooloose/nerdtree.git
sudo git clone https://github.com/jreybert/vimagit.git
  # Text Editing
sudo git clone git://github.com/godlygeek/tabular.git
sudo git clone https://github.com/tpope/vim-surround.git
  # Additional UI
sudo git clone https://github.com/airblade/vim-gitgutter.git
sudo git clone https://github.com/majutsushi/tagbar.git
sudo apt-get install -yqq exuberant-ctags
sudo git clone https://github.com/Twinside/vim-hoogle.git
sudo git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

# HASKELL SETUP ---------------------------------

echo "[3/$tot] install haskell stack, add PATH var"
# stack base
echo PATH="\$PATH:~/.local/bin:/usr/local/bin" >> ~/.profile
. ~/.profile
sudo curl -sSL https://get.haskellstack.org/ | sh
stack setup

# vanilla setup
echo "[4/$tot] setup hoogle, vim tagbar, and syntastic"
if [ $# = 0 ] || [ "$1" = "vh" ]
then
  stack install hoogle
  hoogle data
  hoogle generate
  stack install hasktags
  stack install hdevtools
  stack install hlint
else
  echo " ! skipping vim haskell plugin dependencies"
fi

# tool dependencies
echo "[5/$tot] install haskell project tools (pkg-config, cairo, gtk, pango)"

if [ $# = 0 ]
then
  sudo apt-get -yqq install pkg-config libcairo2-dev gtk2.0 libpango1.0-dev
else
    echo " ! skipping tools"
fi

echo "[$tot/$tot FIN]"
