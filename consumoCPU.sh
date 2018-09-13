#!/bin/bash 
# Determina el porcentaje de CPU que sobrepasa un valor determinado durante 5 segundos.
# Por carlosjulioperez@gmail.com

# Manual
# http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html
# https://stackoverflow.com/questions/5615717/how-to-store-a-command-in-a-variable-in-linux
# https://stackoverflow.com/questions/26791240/how-to-get-percentage-of-processor-use-with-bash

# Solución del porcentaje de cpu:
# https://askubuntu.com/questions/274349/getting-cpu-usage-realtime

contador=0
tiempo=0
typeset -i comando

echo "Porcentaje de CPU a evaluar: ";
read porcentaje;

while [ $tiempo -le 4 ]; do
   
    comando=$(echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')])
    echo $comando

    #if [ ${comando} -gt 60 ]; then 
    if [ ${comando} -ge $porcentaje ]; then 
       let contador=contador+1
    fi
    sleep 1
    let tiempo=tiempo+1
done
echo "El porcentaje de $porcentaje, el CPU ha sobrepasado $contador veces"
