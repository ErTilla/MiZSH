#!/bin/bash
# Verificar si lsd está instalado
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ "$ID" = "kali" ]; then
        echo "El sistema operativo es Kali Linux batcat ni lsd no se puede instalar aqui."
        cp zshkali ~/.zshrc
    fi
else
    if command -v lsd &> /dev/null; then
        echo "lsd está instalado en tu sistema."
    else
        echo "lsd no está instalado en tu sistema."
        sudo apt install lsd

    fi
fi