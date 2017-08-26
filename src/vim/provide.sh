echo "========="
echo "SETUP VIM"
echo "========="

# base
apt-get -y install vim
cp /vagrant/src/vim/.vimrc ~/

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
