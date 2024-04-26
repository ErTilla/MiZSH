#!/bin/bash
# Verificar si zsh está instalado

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
#Ya esta instalado zsh
echo "Ya tiene instalado el ZSH"
else
echo "No tiene instalado el ZSH"
sudo apt install zsh -y

fi
cp ./.zshrc ~/.zshrc
  zsh="$HOME/.oh-my-zsh"
# Verificar si el archivo de configuración de Oh My Zsh existe
if [ -f "$zsh" ]; then
echo "ohmyzsh ya esta instalado"
else
echo "ohmyzsh no esta instalado"
git clone https://github.com/ohmyzsh/ohmyzsh.git && sh ~/.oh-my-zsh/tools/install.sh
fi
# Ruta al archivo de configuración de Powerlevel10k
#p10k="$HOME/.p10k.zsh"        
# Verificar si el archivo de configuración de Powerlevel10k existe
#if [ -f "$p10k" ]; then
#echo "Powerlevel10k está instalado en este sistema."
