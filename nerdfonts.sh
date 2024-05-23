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
    fc-cache -fv
    # Variables de configuración
    FONTFACE="VGA"
    FONTSIZE="16x32"
    CONFIG_FILE="/etc/default/console-setup"

    # Hacer una copia de seguridad del archivo de configuración original
    cp $CONFIG_FILE ${CONFIG_FILE}.bak

    # Editar el archivo de configuración de la consola
    sed -i "s/^FONTFACE=.*/FONTFACE=\"$FONTFACE\"/" $CONFIG_FILE
    sed -i "s/^FONTSIZE=.*/FONTSIZE=\"$FONTSIZE\"/" $CONFIG_FILE

    # Si las líneas no existen, añadirlas al archivo
    grep -q "^FONTFACE=" $CONFIG_FILE || echo "FONTFACE=\"$FONTFACE\"" >> $CONFIG_FILE
    grep -q "^FONTSIZE=" $CONFIG_FILE || echo "FONTSIZE=\"$FONTSIZE\"" >> $CONFIG_FILE

    # Aplicar los cambios
    setupcon

    # Reiniciar el sistema (opcional)
    read -p "¿Deseas reiniciar el sistema para aplicar los cambios? (s/n): " answer
    if [[ $answer =~ ^[Ss]$ ]]; then
         reboot
    fi
fi