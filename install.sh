#!/bin/sh
# Génération d'un espace de travail
# François-Xavier Colas - 2018

apt install -y build-essential terminator curl git vim zsh tmux htop fonts-powerline

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv ~/.zshrc ~/.zshrc_$(date -I).bak
ln -s ./.zshrc ~/.zshrc

# Vim
mkdir -p ~/.vim/.undo
mkdir -p ~/.vim/.swp
mkdir -p ~/.vim/.backup
mv ~/.vimrc ~/.vimrc_$(date -I).bak
ln -s ./.vimrc ~/.vimrc

# Tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
mv ~/.tmux.conf ~/.tmux.conf_$(date -I).bak
ln -s ./.tmux.conf ~/.tmux.conf

# Terminator
mv ~/.config/terminator/config ~/.config/terminator/config_$(date -I).bak
ln -s ./terminator.confir ~/.config/terminator/config

# Monaco font
mkdir -p /usr/share/fonts/truetype/monaco/
cp ./monaco.ttf /usr/share/fonts/truetype/monaco/
fc-cache -f

# Powershell
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
apt update
apt install -y powershell-preview
