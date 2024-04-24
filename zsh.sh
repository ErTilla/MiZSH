#!/bin/bash

# Función para mostrar un mensaje de error y salir con código de error
mostrar_error() {
    echo "Error: $1"
    exit 1
}

# Verificar si zsh está instalado
zsh_path=$(which zsh)
if [ "$?" -ne 0 ]; then
    mostrar_error "zsh no está instalado"
fi

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
    echo "zsh ya está instalado"
else
    # código para instalar zsh
    sudo apt install zsh || mostrar_error "No se pudo instalar zsh"
fi

#Ruta al archivo de configuración de Oh My Zsh
zsh="$HOME/.zshrc"

# Verificar si el archivo de configuración de Oh My Zsh existe
if [ -f "$zsh" ]; then
    echo "Oh My Zsh está instalado en este sistema."
    cp ./.zshrc ~/.zshrc || mostrar_error "No se pudo copiar el archivo de configuración de Oh My Zsh"

    # Ruta al archivo de configuración de Powerlevel10k
    p10k="$HOME/.p10k.zsh"

    # Verificar si el archivo de configuración de Powerlevel10k existe
    if [ -f "$p10k" ]; then
        echo "Powerlevel10k está instalado en este sistema."
        cp ./.p10k.zsh ~/.p10k.zsh || mostrar_error "No se pudo copiar el archivo de configuración de Powerlevel10k"
    else
        echo "Powerlevel10k no está instalado en este sistema."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k || mostrar_error "No se pudo clonar el repositorio de Powerlevel10k"
        echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc || mostrar_error "No se pudo agregar la configuración de Powerlevel10k a .zshrc"
        source ~/.zshrc || mostrar_error "No se pudo recargar la configuración de Zsh"
        cp ./.p10k.zsh ~/.p10k.zsh || mostrar_error "No se pudo copiar el archivo de configuración de Powerlevel10k"
    fi
else
    echo "Oh My Zsh no está instalado en este sistema."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || mostrar_error "No se pudo instalar Oh My Zsh"
    cp ./.zshrc ~/.zshrc || mostrar_error "No se pudo copiar el archivo de configuración de Oh My Zsh"

    # Ruta al archivo de configuración de Powerlevel10k
    p10k="$HOME/.p10k.zsh"

    # Verificar si el archivo de configuración de Powerlevel10k existe
    if [ -f "$p10k" ]; then
        echo "Powerlevel10k está instalado en este sistema."
        cp ./.p10k.zsh ~/.p10k.zsh || mostrar_error "No se pudo copiar el archivo de configuración de Powerlevel10k"
    else
        echo "Powerlevel10k no está instalado en este sistema."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k || mostrar_error "No se pudo clonar el repositorio de Powerlevel10k"
        echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc || mostrar_error "No se pudo agregar la configuración de Powerlevel10k a .zshrc"
        source ~/.zshrc || mostrar_error "No se pudo recargar la configuración de Zsh"
        cp ./.p10k.zsh ~/.p10k.zsh || mostrar_error "No se pudo copiar el archivo de configuración de Powerlevel10k"
    fi
fi

./batcat.sh || mostrar_error "No se pudo ejecutar batcat.sh"
./lsd.sh || mostrar_error "No se pudo ejecutar lsd.sh"
chsh -s /usr/bin/zsh || mostrar_error "No se pudo cambiar el shell a Zsh"
