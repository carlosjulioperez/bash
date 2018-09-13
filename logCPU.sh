#!/bin/bash 
# Genera el log del consumo del cpu
# Por carlosjulioperez@gmail.com

typeset -i comando

comando=$(echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')])
echo $comando > ~/logCPU.txt
