echo Cantidad de memoria antes:
free

#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
# https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/

#echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
#OR
#$ su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'" root

su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'" root

echo
echo Cantidad de memoria después:
free
