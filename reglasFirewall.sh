#!/bin/bash
## Vaciamos las reglas
 iptables -F
 iptables -X
 iptables -t nat -F
 
## Establecemos politicas predeterminada
 iptables -P INPUT ACCEPT
 iptables -P OUTPUT ACCEPT
 iptables -P FORWARD ACCEPT
 iptables -t nat -P PREROUTING ACCEPT
 iptables -t nat -P POSTROUTING ACCEPT
 
# A nuestra IP le permitimos la transmisión de paquetes de entrada y salida
 iptables -A OUTPUT -i enp0s3 -j ACCEPT
 iptables -A INPUT -i enp0s3 -j ACCEPT

# NAT ENTRE RED A Y EXT
 iptables -A FORWARD -i enp0s8 -o enp0s9 -j ACCEPT
 iptables -t nat -A PREROUTING -s 192.168.20.0/24 -i enp0s9
 iptables -t nat -A POSTROUTING -p tcp -s 192.168.20.22
 iptables -t nat -A POSTROUTING -p tcp -d 192.168.10.11

# NAT ENTRE RED B Y EXT
 iptables -A FORWARD -i enp0s9 -o enp0s8 -j ACCEPT
 iptables -t nat -A PREROUTING -s 192.168.10.0/24 -i enp0s8 
 iptables -t nat -A POSTROUTING -p tcp -s 192.168.10.11
 iptables -t nat -A POSTROUTING -p tcp -d 192.168.20.22

# Permitimos una conexión a ssh y telnet (22 y 23) de red B a red A
 iptables -A INPUT -s 192.168.10.11 -p tcp --dport 22:23 -j ACCEPT

# Permitimos una conexión a postgres (5432) de red A a red B
 iptables -A INPUT -s 192.168.20.22 -p tcp --dport 5432 -j ACCEPT
 
# REGLA QUE DENIEGA PING ENTRE MAQUINA A Y CORTAFUEGO 
iptables -I INPUT -p icmp -s 192.168.20.22 --icmp-type 8 -j DROP
