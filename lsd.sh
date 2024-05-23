#!/bin/bash
# Verificar si lsd está instalado
    
if [ -x "$(command -v lsd)" ]; then
        echo "lsd está instalado en tu sistema."
else
        echo "lsd no está instalado en tu sistema."
        sudo apt -y install lsd
    if [ -x "$(command -v lsd)" ]; then
        echo "lsd está instalado en tu sistema."
    else
        echo "lsd no está instalado en tu sistema."
        sudo snap install  lsd
        sudo cp -r /snap/bin/lsd /bin/
    fi

fi
