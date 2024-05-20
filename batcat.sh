#!/bin/bash 
# Comprobar si batcat está instalado


if "which batcat" == "/bin/batcat" ; then
    echo "batcat está instalado en este sistema."
    batcat --version

else
    echo "batcat no está instalado en este sistema."
    sudo apt install bat
fi

if which batcat &> /dev/null ; then
        echo "batcat está instalado en este sistema."
        batcat --version

else
    echo "batcat no está instalado en este sistema (2 prueba)."
    git clone https://github.com/sharkdp/bat.git
    sudo apt -y update
    sudo apt -y install build-essential cmake zlib1g-dev
    cd bat
    cargo build --release
    sudo cp target/release/bat /usr/local/bin/
    cd ../
    bat --version

fi

if which batcat &> /dev/null ; then
    echo "batcat está instalado en este sistema."
    batcat --version

else
    echo "batcat no está instalado en este sistema (3 prueba)."
    sudo rm -r ./bat
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup install stable
    INIT 6
    rustc --version
    cargo --version

# Verificar si Rust está en el PATH
if command -v rustc &> /dev/null; then
    echo "Rust ya está agregado al PATH."
    echo "¡Puedes usar Rust y Cargo desde cualquier ubicación!"
    cargo install bat
                bat --version

else
    echo "Rust no está agregado al PATH."
    echo "Por favor, agrega Rust al PATH para usar Rust y Cargo."
            

        
fi
fi
