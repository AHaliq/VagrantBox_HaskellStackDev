echo "==============="
echo "BEGIN PROVISION"
echo "==============="

tot="6"

echo "[0/$tot] start base; apt-get update"
sudo apt-get -yqq update
echo "[1/$tot] install git, curl, vim and pull config files"
sudo apt-get -yqq install curl git vim
sudo git clone https://github.com/AHaliq/ConfigFiles.git ~/.ConfigFiles
sudo sh ~/.ConfigFiles/install.sh

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
sudo git clone https://github.com/Twinside/vim-hoogle.git

# HASKELL SETUP ---------------------------------

echo "[3/$tot] install haskell stack, add PATH var"
# stack base
echo PATH="\$PATH:~/.local/bin" >> ~/.profile
. ~/.profile
sudo curl -sSL https://get.haskellstack.org/ | sh

# vanilla setup
stack setup
echo "[4/$tot] setup hoogle, and vim tagbar"
stack install hoogle
hoogle data
stack install hasktags
sudo apt-get install -yqq exuberant-ctags

# tool dependencies
echo "[5/$tot] install haskell project tools (pkg-config, cairo, gtk, pango)"
sudo apt-get -yqq install pkg-config libcairo2-dev gtk2.0 libpango1.0-dev

echo "[$tot/$tot FIN]"
