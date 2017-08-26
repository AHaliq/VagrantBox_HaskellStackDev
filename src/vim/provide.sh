echo "========="
echo "SETUP VIM"
echo "========="

# base
apt-get -y install vim
cp /vagrant/src/vim/.vimrc ~/

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Plugins
cd ~/.vim/bundle
  # File Management
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jreybert/vimagit.git
  # Text Editing
git clone git://github.com/godlygeek/tabular.git
git clone https://github.com/tpope/vim-surround.git
  # Additional UI
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/Twinside/vim-hoogle.git
