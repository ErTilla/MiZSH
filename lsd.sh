#!/bin/bash
# Verificar si lsd está instalado
    if command -v lsd &> /dev/null; then
        echo "lsd está instalado en tu sistema."
    else
        echo "lsd no está instalado en tu sistema."
        sudo apt install lsd

    fi