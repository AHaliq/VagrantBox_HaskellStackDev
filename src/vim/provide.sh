echo "========="
echo "SETUP VIM"
echo "========="

# base
apt-get -y install vim

echo "**** DONE BASE INSTALL ****"

# pathogen
sudo mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
sudo curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Plugins
cd /home/vagrant/.vim/bundle
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
