#! /bin/bash

while :
do 


echo " Elije una opcion para configurar la interfaz"

echo "[1] Cableada"

echo "[2] Inalambrica"

echo "[3] Salir"

echo "Ingresa la opción: "
read opcion

case $opcion in


1) echo "Cableada:";

echo "[1] Estática"
echo "[2] Dinámica"

echo "Ingresa la opción: " 
read opcion

case $opcion in

1) echo "Estática: "

echo -e "\nSE MOSTRARAN LAS INTERFACES DE RED\n"
sudo ifconfig
sleep 7

echo -e "\n¿QUE INTERFAZ QUIERES CONFIGURAR?"
read interfaz
echo -e "\nINGRESA LA IP"
read ip
echo -e "\nINGRESA LA MASCARA"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\nSE HA CONFIGURADO CORRECTAMENTE"

echo -e "\nIngresa la ip del gateway: "
read gw
route add default gw $gw

;;

2) echo "Dinámica: "

echo -e "\nSE MOSTRARAN LAS INTERFACES DE RED\n"
sudo ifconfig
sleep 7

echo -e "\n¿QUE INTERFAZ QUIERES CONFIGURAR?"
read interfaz

sudo dhclient $interfaz

;;

esac
;;

2) echo "Inalambrica: "

echo "[1] Estática"
echo "[2] Dinámica"

echo "Ingresa la opción: " 
read opcion

case $opcion in

1) echo "Estática: "
echo -e "\nSE MOSTRARAN LAS INTERFACES DE RED\n"
sudo ifconfig
sleep 7

echo -e "\n¿QUE INTERFAZ QUIERES CONFIGURAR?"
read interfaz
echo -e "\n*Se mostraran las redes disponibles*"
sudo iwlist $interfaz scan
echo -e "\nIngresa el ESSID de la red a la que deseas acceder: "
read essid
echo -e "\nSi la red tiene contraseña, ingresala: "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass

echo -e "\nINGRESA LA IP"
read ip
echo -e "\nINGRESA LA MASCARA"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\nSE HA CONFIGURADO CORRECTAMENTE"

echo -e "\nIngresa la ip del gateway: "
read gw
route add default gw $gw

;;

2) echo -e "\n Dinámica: "
echo -e "\nSE MOSTRARAN LAS INTERFACES DE RED\n"
sudo ifconfig
sleep 7

echo -e "\n¿QUE INTERFAZ QUIERES CONFIGURAR?"
read interfaz
echo -e "\n*Se mostraran las redes disponibles*"
sudo iwlist $interfaz scan
echo -e "\nIngresa el ESSID de la red a la que deseas acceder: "
read essid
echo -e "\nSi la red tiene contraseña, ingresala: "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass

sudo dhclient $interfaz

;;

esac
;;

3) echo "Hasta luego...";

exit 1;;

esac
done

