#!/bin/bash
# Comprobar si batcat está instalado
if which batcat &> /dev/null ; then
    echo "batcat está instalado en este sistema."
    batcat --version

else
    echo "batcat no está instalado en este sistema."
    git clone https://github.com/sharkdp/bat.git
    sudo apt-get install -y build-essential cmake zlib1g-dev
    cd bat
    cargo build --release
    sudo cp target/release/bat /usr/local/bin/
    bat --version
fi