#!/bin/bash
echo -e "Ingresa el nombre del usuario\n"
read usuario

echo -e "\nIngresa un comentario para el usuario\n"
read comentario

echo -e "\nEstos son los grupos que hay\n"
cat /etc/group

echo -e "\nIngresa el nombre del grupo para el usuario\n"
read grupo
sudo groupadd $grupo

echo -e "\nIngrese la ruta del directorio hogar (Por default es: /home/'nombreUsuario'\n"
read home

sudo useradd -c $comentario -d $home -m -k /etc/skel -g $grupo -s /bin/bash $usuario

echo -e "\nSE HA CREADO EL USUARIO\n"
sleep 3

echo -n "Se modificara la contraseña del usuario: "$usuario
sleep 3
echo -e "\nIngrese la contraseña del usuario"
echo -e "debe ser de 8 caracteres, 2 mayusculas y 1 numero\n"
STTY_SAVE=`stty -g`
stty -echo
read contra
stty $STTY_SAVE
longitud=${#contra}
if [ $longitud = 8 ];
then 
	echo -e "\nCumple la condicion\n"
	echo "$usuario:$contra" | sudo chpasswd
	else
		echo -e "\nNo cumple la condicion\n"
fi

echo -e "CONTRASEÑA DEFINIDA"
sleep 2
sleep 5
echo -e "\n"



echo -e "A CONTINUACION, DESEA AGREGAR SUDO AL USUARIO?\n"

echo -e  "[1] Sí"
echo -e  "[2] No"

read x
  case $x in
     1)
        sudo sed -i '$a '$usuario' ALL=(ALL:ALL) ALL' /etc/sudoers
		sleep 4
		echo -e "\nSE ASIGNO CORRECTAMENTE EN /ETC/SUDOERS\n"

     ;;
     2)
        echo "Hasta luego..."
		exit 1
     ;;
  esac



