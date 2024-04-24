#!/bin/bash

# Verificar si zsh está instalado
zsh_path=$(which zsh)

if [ "$zsh_path" == "/usr/bin/zsh" ]; then
    echo "zsh ya está instalado"
    #Ruta al archivo de configuración de Oh My Zsh
    zsh="$HOME/.zshrc"

    # Verificar si el archivo de configuración de Oh My Zsh existe
    if [ -f "$zsh" ]; then
        echo "Oh My Zsh está instalado en este sistema."
        cp ./.zshrc ~/.zshrc

        # Ruta al archivo de configuración de Powerlevel10k
        p10k="$HOME/.p10k.zsh"

        # Verificar si el archivo de configuración de Powerlevel10k existe
        if [ -f "$p10k" ]; then
            echo "Powerlevel10k está instalado en este sistema."
            cp ./.p10k.zsh ~/.p10k.zsh
        else
            echo "Powerlevel10k no está instalado en este sistema."
           git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
            echo 'source $HOME/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
            source ~/.zshrc
            cp ./.p10k.zsh ~/.p10k.zsh

        fi

    else
        echo "Oh My Zsh no está instalado en este sistema."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        cp ./.zshrc ~/.zshrc
        # Ruta al archivo de configuración de Powerlevel10k
        p10k="$HOME/.p10k.zsh"

        # Verificar si el archivo de configuración de Powerlevel10k existe
        if [ -f "$p10k" ]; then
            echo "Powerlevel10k está instalado en este sistema."
            cp ./.p10k.zsh ~/.p10k.zsh
        else
            echo "Powerlevel10k no está instalado en este sistema."
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
            echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
            source ~/.zshrc
            cp ./.p10k.zsh ~/.p10k.zsh

        fi

    fi

else
    echo "zsh no está instalado"
    # código para instalar zsh
    sudo apt install zsh
    #Ruta al archivo de configuración de Oh My Zsh
    zsh="$HOME/.zshrc"

    # Verificar si el archivo de configuración de Oh My Zsh existe
    if [ -f "$zsh" ]; then
        echo "Oh My Zsh está instalado en este sistema."
        cp ./.zshrc ~/.zshrc

        # Ruta al archivo de configuración de Powerlevel10k
        p10k="$HOME/.p10k.zsh"

        # Verificar si el archivo de configuración de Powerlevel10k existe
        if [ -f "$p10k" ]; then
            echo "Powerlevel10k está instalado en este sistema."
            cp ./.p10k.zsh ~/.p10k.zsh
        else
            echo "Powerlevel10k no está instalado en este sistema."
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
            echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
            source ~/.zshrc
            cp ./.p10k.zsh ~/.p10k.zsh

        fi

    else
        echo "Oh My Zsh no está instalado en este sistema."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        cp ./.zshrc ~/.zshrc
        # Ruta al archivo de configuración de Powerlevel10k
        p10k="$HOME/.p10k.zsh"

        # Verificar si el archivo de configuración de Powerlevel10k existe
        if [ -f "$p10k" ]; then
            echo "Powerlevel10k está instalado en este sistema."
            cp ./.p10k.zsh ~/.p10k.zsh
        else
            echo "Powerlevel10k no está instalado en este sistema."
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
            echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
            source ~/.zshrc
            cp ./.p10k.zsh ~/.p10k.zsh
            

        fi

    fi
fi
./batcat.sh
./lsd.sh

chsh -s /usr/bin/zsh

exit 0
