#!/bin/bash

# Especificar el nombre de la Nerd Font a buscar
FONT_NAME="HackNerd Font"

# Usar fc-list para verificar si la fuente está instalada
if fc-list | grep -q "$FONT_NAME"; then
    echo "Nerd Font está instalada"
else
    echo "Nerd Font no está instalada"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip 
    unzip Hack.zip
    sudo mv ./*.ttf /usr/share/fonts/
    sudo cp ~/MiZSH/console-setup /etc/default/console-setup
    sudo setupcon

fi
