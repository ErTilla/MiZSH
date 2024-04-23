
#sudo apt install zsh
echo "Empezamos Instalacion de zsh"
zsh= /root/.zshrc 
if (-e "$zsh");
then
echo "ya esta instalado"
else
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#echo "Empezamos instalacion de ohmyzsh"
#
