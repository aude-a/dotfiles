#!/bin/bash
# Génération d'un espace de travail
# François-Xavier Colas - 2018

REP="$( cd "$(dirname "$0")" ; pwd -P )"

sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential fluxbox terminator curl git vim zsh tmux htop iotop iftop fonts-powerline

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv $HOME/.zshrc $HOME/.zshrc_$(date -I).bak
ln -s $REP/zshrc $HOME/.zshrc

# Vim
mkdir -p $HOME/.vim/.undo $HOME/.vim/.swp $HOME/.vim/.backup
mv $HOME/.vimrc $HOME/.vimrc_$(date -I).bak
ln -s $REP/vimrc $HOME/.vimrc

# Fluxbox
mkdir -p $HOME/.fluxbox
cat << EOF >> $HOME/.fluxbox/startup
#!/bin/sh
terminator &
exec fluxbox
EOF

# Tmux
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack
mv $HOME/.tmux.conf $HOME/.tmux.conf_$(date -I).bak
ln -s $REP/tmux.conf $HOME/.tmux.conf

# Terminator
mv $HOME/.config/terminator/config $HOME/.config/terminator/config_$(date -I).bak
mkdir -p $HOME/.config/terminator
ln -s $REP/terminator/terminator.config $HOME/.config/terminator/config

# Monaco font
sudo mkdir -p /usr/share/fonts/truetype/monaco/
sudo cp $REP/terminator/monaco.ttf /usr/share/fonts/truetype/monaco/
sudo fc-cache -f

# Powershell
sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
sudo apt update
sudo apt install -y powershell-preview

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt update
sudo apt install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
