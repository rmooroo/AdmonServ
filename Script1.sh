#! /bin/bash 

echo -e "Archivos y directorios que puedes recuperar \n"
ls -1 /home/rafael/.local/share/Trash/files/

read recuperar

echo -e "\n"

mv /home/rafael/.local/share/Trash/files/$recuperar /home/rafael/Documentos/ScriptsServidores/

echo -e "\n Se ha recuperado \n"

