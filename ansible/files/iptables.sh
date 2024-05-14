#!/bin/bash
#  Configuramos las variables de iptables
ipProxmox='192.168.1.2'
ipBalanceadorWEB='10.0.0.50'
#cd ~/conf/
#source variables.sh
#/bin/echo "[CONFIGURACIÓN DE IPTABLES]"
#  Configuramos el NAT
netfilter-persistent flush
iptables -t nat -A POSTROUTING -o vmbr0 -j SNAT --to-source $ipProxmox
iptables -t nat -A PREROUTING -i vmbr0 -p tcp -d $ipProxmox -m multiport --dports 80,443 -j DNAT --to-destination $ipBalanceadorWEB
#  Configuración de reglas
#----------------------------


#----------------------------
#  Las convertimos en permanentes
netfilter-persistent save
#/bin/echo "[IPTABLES CONFIGURADAS]"
