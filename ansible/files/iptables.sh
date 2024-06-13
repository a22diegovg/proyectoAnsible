#!/bin/bash
#  Configuramos las variables de iptables
ipProxmox='192.168.1.2'
ipBalanceadorWEB='10.0.0.200'
ipBalanceadorBD_GFS='10.0.1.200'
#  Configuramos el NAT
netfilter-persistent flush
iptables -t nat -A POSTROUTING -o vmbr0 -j SNAT --to-source $ipProxmox
#  Configuración de DNAT
iptables -t nat -A PREROUTING -i vmbr0 -p tcp -d $ipProxmox -m multiport --dports 80,443 -j DNAT --to-destination $ipBalanceadorWEB
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 8000 -d $ipProxmox -j DNAT --to ${ipBalanceadorWEB}:8000
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 8010 -d $ipProxmox -j DNAT --to ${ipBalanceadorBD_GFS}:8000

#  Configuración de reglas
#----------------------------


#----------------------------
#  Las convertimos en permanentes
netfilter-persistent save

