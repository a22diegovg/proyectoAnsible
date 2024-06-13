# -----------------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------------
#  Configuración de los servidores web
resource "proxmox_lxc" "web" {
  count           = 3 #  Indicamos el numero de contenedores que queremos crear
  target_node     = var.nodo01 #  Indicamos el nombre del nodo en el que se van a instalar los contenedores
  ssh_public_keys = var.key_public_ansible #  Clave ssh que nos permitirá conectarnos al host.
  hostname        = "web-${count.index}" #  Le ponemos un nombre, que cambiará en función de numero de contenedores que se cree
  ostemplate      = var.ubuntu22 #  Indicamos que sistema operativo tendra el contenedore, es la ubucación de la plantilla
  start           = true #  Para que se arranque despues de su ejecucion
  #password = "abc123."  
  onboot = true # Para que se inicia cada vez que se encienda proxmox
  unprivileged = false # Indicamos que queremos que el contenedor tenga privilegios
  #  Configuramos el almacenamiento interno de cada servidor
  rootfs {
    size    = "3G"
    storage = "local-lvm"
  }
  #  Configuracimos la red
  network {
    name = "eth0" 
    bridge = "vmbr1"
    gw = "10.0.0.1"
    ip   = "10.0.0.${count.index + 10}/24" #  Le sumamos un numero a la ip
  }
}
# -----------------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------------
#  Configuración del balanceador de carga web
resource "proxmox_lxc" "balanceadorWEB" {
  count           = 1
  target_node     = var.nodo01 
  ssh_public_keys = var.key_public_ansible 
  hostname        = "bcw-${count.index}" 
  ostemplate      = var.ubuntu22 
  start           = true
  #password = "abc123."
  onboot = true 
  unprivileged = false
  #  Configuramos el almacenamiento interno de cada servidor
  rootfs {
    size    = "1G"
    storage = "local-lvm"
  }
  #  Configuracimos la red
  network {
    name = "eth0" 
    bridge = "vmbr1"
    gw = "10.0.0.1"
    ip   = "10.0.0.${count.index + 200}/24" 
  }
}
# -----------------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------------
#  Configuración del balanceador de carga bd
resource "proxmox_lxc" "balanceadorBD" {
  count           = 1                                                     
  target_node     = var.nodo01                                                  
  #ssh_public_keys = var.key_public                                         
  ssh_public_keys = var.key_public_ansible
  hostname        = "bcbd-${count.index}"                                   
  ostemplate      = var.ubuntu22 
  start           = true 
  #password = "abc123."
  onboot = true 
  unprivileged = false
  #  Configuramos el almacenamiento interno de cada servidor
  rootfs {
    size    = "1G"
    storage = "local-lvm"
  #  Configuramos la red
  }
  network {
    name = "eth0" 
    bridge = "vmbr2"
    gw = "10.0.1.1"
    ip   = "10.0.1.${count.index + 200}/24"
  }
}
# -----------------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------------
#  Configuración de las bases de datos
resource "proxmox_lxc" "bd" {
  count           = 3                                                    
  target_node     = var.nodo01                                                                                     
  ssh_public_keys = var.key_public_ansible
  hostname        = "bd-${count.index}"                                   
  ostemplate      = var.ubuntu22
  start           = true 
  #password = "abc123."
  onboot = true 
  unprivileged = false
  #  Configuramos el almacenamiento interno de cada servidor
  rootfs {
    size    = "20G"
    storage = "local-lvm"
  }
  network {
    name = "eth0" 
    bridge = "vmbr2"
    gw = "10.0.1.1"
    ip   = "10.0.1.${count.index + 10}/24" 
  }
}
# -----------------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------------
#  Configuracion de los servidores GlusterFS
resource "proxmox_lxc" "gfs" {
  count           = 3                                                      
  target_node     = var.nodo01                                                                                      
  ssh_public_keys = var.key_public_ansible
  hostname        = "gfs-${count.index}"                                   
  ostemplate      = var.ubuntu22 
  start           = true 
  #password = "abc123."
  onboot = true 
  unprivileged = false
  
  #  Configuramos el almacenamiento interno de cada servidor
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
  #  Configuracimos la red
  network {
    name = "eth0" #  Los servidores web estarán en la red: 10.0.0.0/24
    bridge = "vmbr2"
    gw = "10.0.1.1"
    ip   = "10.0.1.${count.index + 150}/24" #  En este caso le sumamo 20 para que nunca coincida con la ip del proxmox
  }
}
