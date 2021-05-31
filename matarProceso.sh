read -p "Nombre del proceso a eliminar (en cascada): " proceso
sudo kill -KILL `ps -e | grep $proceso | awk '{print $1}'`
