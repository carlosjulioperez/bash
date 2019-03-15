#!/bin/sh
# Realiza un respaldo de cada base de datos especificada en el arreglo.
# 2019-03-15 carper

if [ -z "$1" ] 
then
   echo "Ingrese la hora del respaldo"
   exit 1
fi

DIR=/var/backup/2019
DATE=`date +%d-%m-%Y`
[ ! $DIR ] && mkdir -p $DIR || :

# /usr/bin/pg_dump -U postgres him | bzip2 -c > $DIR/$DATE-$1.him.sql.bz2

db_array=(him hpm)
#for i in "${db_array[@]}"; do echo "$i"; done
for i in "${db_array[@]}"; do 
   /usr/bin/pg_dump -U postgres $i | bzip2 -c > $DIR/$DATE-$1.$i.sql.bz2; 
done
