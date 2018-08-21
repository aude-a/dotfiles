#!/bin/sh
# Génération d'un espace de travail
# François-Xavier Colas - 2018

REP="$( cd "$(dirname "$0")" ; pwd -P )"

apt install -y build-essential fluxbox terminator curl git vim zsh tmux htop iotop iftop fonts-powerline

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv ~/.zshrc ~/.zshrc_$(date -I).bak
ln -s $REP/.zshrc ~/.zshrc

# Vim
mkdir -p ~/.vim/.undo ~/.vim/.swp ~/.vim/.backup
chown -R $USER:$USER ~/.vim
mv ~/.vimrc ~/.vimrc_$(date -I).bak
ln -s $REP/.vimrc ~/.vimrc

# Fluxbox
mkdir -p ~/.fluxbox
cat << EOF >> ~/.fluxbox/startup
#!/bin/sh
terminator &
exec fluxbox
EOF
chown -R $USER:$USER ~/.fluxbox

# Tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
mv ~/.tmux.conf ~/.tmux.conf_$(date -I).bak
ln -s $REP/.tmux.conf ~/.tmux.conf

# Terminator
mv ~/.config/terminator/config ~/.config/terminator/config_$(date -I).bak
ln -s $REP/terminator.config ~/.config/terminator/config

# Monaco font
mkdir -p /usr/share/fonts/truetype/monaco/
cp $REP/monaco.ttf /usr/share/fonts/truetype/monaco/
fc-cache -f

# Powershell
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
apt update
apt install -y powershell-preview

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt update
apt install -y docker-ce
groupadd docker
usermod -aG docker $USER
