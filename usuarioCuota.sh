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
sleep 3

echo -e "\n"
echo -e "¿Deseas agregarle una quota al usurio?"

echo "[1] Si"
echo "[2] No"

read x
  case $x in
     1)
        sudo edquota -u $usuario

		echo -e "\nSE HA ASIGNADO LA CUOTA\n"
		sleep 2

     ;;
     2)
        echo "hasta luego..."
		exit 1
     ;;
  esac
