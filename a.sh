#!/bin/bash

mv tmp ~/
zsh_path=$(which zsh)

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
    echo "zsh ya está instalado"
else
echo "zsh no está instalado"
# código para instalar zsh
sudo apt install zsh
fi
 # Verificar si el archivo de configuración de Oh My Zsh existe
if [ "$ZSH"=="~/.oh-my-zsh" ]; then
echo "Oh My Zsh está instalado en este sistema."
cp ~/tmp/.zshrc ~/.zshrc
else
echo "Oh My Zsh no está instalado en este sistema."
cp ~/tmp/.zshrc ~/.zshrc
git clone https://github.com/ohmyzsh/ohmyzsh.git
sh ./ohmyzsh/tools/install.sh

fi
# Ruta al archivo de configuración de Powerlevel10k
p10k="$HOME/.p10k.zsh"
        
# Verificar si el archivo de configuración de Powerlevel10k existe
if [ -f "$p10k" ]; then
echo "Powerlevel10k está instalado en este sistema."
sudo cp -r ./tmp/.p10k.zsh ~/.p10k.zsh
else
echo "Powerlevel10k no está instalado en este sistema."
git clone https://github.com/romkatv/powerlevel10k.git 
echo 'source ~/MiZSH/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
source ~/.zshrc
sudo cp -r ~/tmp/.p10k.zsh ~/.p10k.zsh
fi
sh ~/tmp/batcat.sh
sh ~/tmp/lsd.sh