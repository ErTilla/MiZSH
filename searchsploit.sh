#/bin/bash

if which searchsploit &>/dev/null; then
    echo "searchsploit está instalado"
else
    sudo apt -y update
    sudo apt -y install exploitdb

    if which searchsploit &>/dev/null; then
        echo "searchsploit está instalado después de instalar exploitdb"
    else
        sudo snap install --no-wait searchsploit

        if which searchsploit &>/dev/null; then
            echo "searchsploit está instalado después de instalar con snap"
        else
            echo "La instalación de searchsploit falló"
        fi
    fi
fi
