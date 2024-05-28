#!/bin/bash


echo "Nerd Font no está instalada"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip 
    unzip Hack.zip
    sudo mv ./*.ttf /usr/share/fonts/
    fc-cache -fv


# Define el UUID del perfil que deseas cambiar (reemplaza con tu UUID real)
PROFILE_UUID="UUID1" # Reemplazar con el UUID real

# Nueva fuente que deseas establecer
NEW_FONT="Hack Nerd Font Mono 12"

# Cambiar la fuente del perfil
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/font "'$NEW_FONT'"

echo "Fuente cambiada a $NEW_FONT en el perfil $PROFILE_UUID
