# config shell
changeSource=true

# change apt's source
if [ $changeSource = true ]
then
  cp sources.list /etc/apt
  apt-get update
fi

# install basic software
apt-get install -y vim
apt-get install -y curl
apt-get install -y openssh-server
apt-get install -y nginx
apt-get install -y git

# install node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y yarn

# vim plugin
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/posva/vim-vue.git ~/.vim/bundle/vim-vue

# vim config
cp .vimrc ~
