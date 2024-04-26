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
#Ruta al archivo de configuración de Oh My Zsh
zsh="$HOME/.oh-my-zsh"
 cp ~/tmp/.zshrc ~/.zshrc
 # Verificar si el archivo de configuración de Oh My Zsh existe
if [ -f "$zsh" ]; then
echo "Oh My Zsh está instalado en este sistema."
else
echo "Oh My Zsh no está instalado en este sistema."
sh ./oh-my-zsh/tools/install.sh
fi