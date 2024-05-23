#!/bin/bash

if which searchsploit &>/dev/null; then
    echo "searchsploit está instalado"
else
    sudo apt -y update
    sudo apt -y install exploitdb

    if which searchsploit &>/dev/null; then
        echo "searchsploit está instalado después de instalar exploitdb"
    else
        sudo snap install --no-wait searchsploit
    fi
fi

zsh_path=$(which zsh)

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
    echo "zsh ya está instalado"
else
echo "zsh no está instalado"
# código para instalar zsh
sudo apt -y install zsh
fi
 # Verificar si el archivo de configuración de Oh My Zsh existe
if [ -z "$ZSH" ]; then
echo "Oh My Zsh no está instalado en este sistema."
git clone https://github.com/ohmyzsh/ohmyzsh.git
sh ./ohmyzsh/tools/install.sh --unattended
cp ./tmp/.zshrcroot ~/.zshrc
else
echo "Oh My Zsh está instalado en este sistema."
cp ./tmp/.zshrcroot ~/.zshrc
fi
# Ruta al archivo de configuración de Powerlevel10k
p10k="$HOME/.p10k.zsh"
        
# Verificar si el archivo de configuración de Powerlevel10k existe
if [ -f "$p10k" ]; then
echo "Powerlevel10k está instalado en este sistema."
sudo cp -r ./tmp/p10kroot ~/.p10k.zsh
cp -r ~/MiZSH/powerlevel10k ~/.oh-my-zsh/themes/
else
echo "Powerlevel10k no está instalado en este sistema."
git clone https://github.com/romkatv/powerlevel10k.git 
cp -r ~/MiZSH/powerlevel10k ~/.oh-my-zsh/themes/
sudo cp -r ./tmp/p10kroot ~/.p10k.zsh
fi
sh ~/MiZSH/batcat.sh
sh ~/MiZSH/lsd.sh
sh ~/MiZSH/ftp.sh
chsh -s $(which zsh)