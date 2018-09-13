#!/bin/bash

# Variables:
# http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html

# Descarga de sitio con wget (con 1 nivel de profundidad busca en las html principales)
# https://www.lifewire.com/uses-of-command-wget-2201085

# Obtener todas las direcciones de correo de archivos texto usando expresiones regulares
# https://www.putorius.net/2011/12/grep-all-email-addresses-from-text-file.html

#Cortar un string después de los dos puntos:
#https://www.linuxquestions.org/questions/programming-9/sed-get-all-text-after-first-colon-865629/

# Ordena y no permite duplicados...
# sort | uniq 

# Por: carlosjulioperez@gmail.com

tmpdir="/tmp/offline"
url="https://www.fiec.espol.edu.ec/"

if [ -d $tmpdir ]; then
    rm -rf $tmpdir
fi    

mkdir -p $tmpdir
cd $tmpdir
#wget -r -l1 ‐R 'jpg,gif,png,jpeg' $url
wget -r -l1 $url

grep -Ero "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" * | cut -d: -f2- | sort | uniq > correos.txt
cat $tmpdir/correos.txt

