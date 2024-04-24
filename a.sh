#!/bin/bash
# Comprobar si batcat está instalado
if which batcat &> /dev/null ; then
    echo "batcat está instalado en este sistema."
    batcat --version

else
    echo "batcat no está instalado en este sistema."
    sudo apt install bat

    if which batcat &> /dev/null ; then
        echo "batcat está instalado en este sistema."
        batcat --version

    else
        echo "batcat no está instalado en este sistema (2 prueba)."
        git clone https://github.com/sharkdp/bat.git
        sudo apt update
        sudo apt install build-essential cmake zlib1g-dev
        cd bat
        cargo build --release
        sudo cp target/release/bat /usr/local/bin/
        cd ../
        bat --version
        if which batcat &> /dev/null ; then
            echo "batcat está instalado en este sistema."
            batcat --version

        else
            echo "batcat no está instalado en este sistema (3 prueba)."
            sudo rm -r ./bat

        fi
    fi
fi