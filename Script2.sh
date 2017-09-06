#! /bin/bash

ls -1 /home/rafael/Documentos/ScriptsServidores/
echo -e "\nPara borrar, ingrese el nombre del archivo o directorio\n"

read borrar

mv /home/rafael/Documentos/ScriptsServidores/$borrar /home/rafael/.local/share/Trash/files/

echo -e  "\n Se ha borrado el archivo\n"

