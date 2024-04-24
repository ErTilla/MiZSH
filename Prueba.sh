#!/bin/bash

# Verificar si zsh está instalado
zsh_path=$(which zsh)

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
    echo "zsh ya está instalado"
else
    echo "zsh no está instalado"
    # Aquí puedes agregar el código para instalar zsh si lo deseas
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
