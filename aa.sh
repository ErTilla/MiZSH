#!/bin/bash


echo "Nerd Font no está instalada"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip 
    unzip Hack.zip
    sudo mv ./*.ttf /usr/share/fonts/
    fc-cache -fv

# Nombre del perfil que deseas cambiar (por defecto suele ser 'default')
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# Nueva fuente que deseas establecer
NEW_FONT="Hack Nerd Font Mono 12"
sudo apt-get install gnome-terminal gsettings-desktop-schemas

# Cambiar la fuente del perfil
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/" font "$NEW_FONT"

echo "Fuente cambiada a $NEW_FONT en el perfil $PROFILE"
