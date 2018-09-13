scp cjpq@200.126.7.35:~/logCPU.txt ~
#cat ~/logCPU.txt

read CONSUMO < ~/logCPU.txt
echo ${CONSUMO}
if [ ${CONSUMO} -ge 40 ]; then 
   echo "El consumo de CPU supera el 40%" 
fi
   
