#!/bin/bash
#usuario='terraform_user@pve'
#contra='abc123.'
#ipProxmox='192.168.1.10'
#ipBalanceadorWEB='10.0.0.50'
#plantillaLXC="debian-12-standard_12.2-1_amd64.tar.zst"
cd ~/proxmox/conf/
source ./variables.sh
#  Configuramos las redes del servidor proxmox
/bin/echo "[CONFIGURACIÓN DE LAS REDES DEL ENTORNO]"
/bin/cp ./redes-proxmox /etc/network/interfaces.d/
/bin/systemctl restart networking.service
/bin/echo "[REDES DEL ENTORNO CONFIGURADAS]"
#  Habilitamos el enrutamiento del servidor
/bin/echo "[CONFIGURACIÓN DE ENRUTAMIENTO]"
/bin/sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
/sbin/sysctl -p
/bin/echo "[ENRUTAMIENTO CONFIGURADO]"
#  Configuramos la instalación para convertir las iptables permanentes
#  Instalamos las iptables persistentes
apt update
/bin/echo 'iptables-persistent iptables-persistent/autosave_v4 boolean true' | /bin/debconf-set-selections
/bin/echo 'iptables-persistent iptables-persistent/autosave_v6 boolean true' | /bin/debconf-set-selections
/bin/apt install iptables-persistent -y
source ./iptables.sh
#  Descargamos la plantilla que usaran los contenedores LXC en Proxmox
/bin/echo "[CONFIGURACIÓN PROXMOX]"
/bin/pveam download local $plantillaLXC_12
/bin/pveam download local $plantillaLXC_11
/bin/pveam download local $plantillaLXC_22
#  Configuramos un usuario y sus permisos para Terraform
/sbin/pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
#/sbin/pveum user add terraform_user@pve --password abc123.
#/sbin/pveum aclmod / -user terraform_user@pve -role TerraformProv
/sbin/pveum user add $usuario --password $contra
/sbin/pveum aclmod / -user $usuario -role TerraformProv
/bin/echo "[PROXMOX CONFIGURADO]"
#  Instalamos ansible
source ../ansible/install-ansible.sh
#  Generar claves para ansible
#  Esta clave generada será la que se le pase al código de terraform en el archivo de vars.tf
/bin/echo "[CREACIÓN DE CLAVES]"
/bin/ssh-keygen -C 'ansible_key' -f /root/.ssh/ansible_rsa -N '' -t rsa



