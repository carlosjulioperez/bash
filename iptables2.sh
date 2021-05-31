echo Aplicando Firewall

##Inicializar reglas de iptables
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

## ACCEPT/DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#iptables -t nat -P PREROUTING DROP
#iptables -t nat -P POSTROUTING DROP

# Acepta conexiones locales
/sbin/iptables -A INPUT -i lo -j ACCEPT

# Permitir a la IP del administrador permiso total por cualquier puerto
#iptables -A INPUT -s 200.126.7.98 -j ACCEPT
#iptables -A OUTPUT -d 200.126.7.98 -j ACCEPT

# Activar iptables para cualquier equipo en el puerto 22
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

# Activar iptables desde una IP específica en el puerto 22
iptables -A INPUT -s 200.126.7.98 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -d 200.126.7.98 -p tcp --sport 22 -j ACCEPT

iptables -A INPUT -s 200.126.7.78 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -d 200.126.7.78 -p tcp --sport 22 -j ACCEPT

# Activar iptables para cualquier equipo en el puerto 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
