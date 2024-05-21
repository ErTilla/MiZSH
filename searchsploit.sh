#/bin/bash

if which searchsploit &>/dev/null ; then
    echo "esta instalado"
else
    sudo apt -y update 
    sudo apt -y install exploitdb
    if which searchsploit &>/dev/null ; then
        echo "searchsploit esta instalado"
    else
        sudo snap install --no-wait searchsploit
    fi
fi