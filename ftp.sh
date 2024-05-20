#/bin/bash

if [ $(/usr/bin/which ftp) == "/usr/bin/ftp" ]; then
echo "ftp esta instalado"
else
echo "ftp no esta instalado"
sudo apt -y install ftp 
fi