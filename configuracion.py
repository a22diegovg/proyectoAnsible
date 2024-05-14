from fabric import Connection
from funciones import *
from os import system
from jinja2 import Template
from variables import user_proxmox,password_proxmox,ip_server,user_server,nodo01,plantillaLXC_12,plantillaLXC_11,plantillaLXC_24
try:
    c = Connection(host=ip_server,user=user_server) #  Creamos una conexión por ssh hacia el servidor, como tenemos clave no necesitamos contraseña
    print('Conexión SSH exitosa')
    #  Copiamos la carpeta de proxmox y ansible al servidor remoto
    try:
        #  Comprimimos el archivo para enviarlo ya que fabric no puede pasar directorios
        directorio1 = './proxmox_conf'
        archivo_tar = 'proxmox'
        destino = f'/{user_server}/'
        directorios = [directorio1] #  Se crea una lista por si hubiera que comprimir más directorios
        c.run(' if [ -d "./proxmox" ]; then rm -r "proxmox"; fi')
        comprimir(directorios,archivo_tar)
        c.put(archivo_tar,destino) #  Enviamos el archivo por ssh
        c.run(f'tar -xvf {destino}/{archivo_tar} ') #  Descomprimimos el archivo en el servidor proxmox
        os.remove(archivo_tar) #  Borramos el archivo creado una vez pasado por ssh    
    except Exception as e:
        print("Error en el trapaso de los ficheros: ",e)
    try:
    #  Ejecutamos el script proxmox-conf.sh, este al final geneta una clave que tenemos que copiar para luego añadir al archivo de variables de terraform
        archivoSSHpub = f'/{user_server}/.ssh/ansible_rsa.pub'
        archivoSSH = f'/{user_server}/.ssh/ansible_rsa'        
        c.run(f' if [ -f "{archivoSSH}" ]; then rm "{archivoSSH}" "{archivoSSHpub}"; fi') #  Esta linea no hará falta despue porque se eliminara despues
        c.run(f"bash {destino}{archivo_tar}/conf/proxmox-conf.sh")
        c.get(archivoSSHpub,'./')
        #c.run(f"bash {destino}{archivo_tar}/conf/iptables.sh") #  Se configuran a parte por si se mete reglas que cierren ssh
    except Exception as e:
        print("Error en la ejecución de archivo proxmox-conf.sh: ",e)
    try:
    #  Creamos el archivo de variables de terraform
        keyansiblepublica = './ansible_rsa.pub'
        with open(keyansiblepublica,'r') as f: #  Se en forma binaria para que no incluya el salto de linea final
            sshkey = f.read()
        sshkey = sshkey.strip() #  Se limpian los caracteres especiales
        with open('./plantillas/plantilla.var.terraform.j2') as p:
            varTerra = p.read()
        #  Se compila la plantilla de las variables de terraform
        plantilla = Template(varTerra)
        #  Se crea un diccionario con los datos de las variables
        datos = {
            'usuario':user_proxmox,
            'contrasenha':password_proxmox,
            'clavessh': sshkey,
            'ipservidor':ip_server,
            'nodo01':nodo01,
            'debian11':plantillaLXC_11,
            'debian12':plantillaLXC_12,
            'ubuntu':plantillaLXC_24
        }
        ficheroVariables = plantilla.render(datos)
        with open('./terraform/vars_terraform.tf','w') as fk:
            fk.write(ficheroVariables)
        print('Archivo de variables de Terraform creado')
        #  Eliminamos el fichero de la clave publica
        os.remove(keyansiblepublica)
    except Exception as e:
        print('Hubo un problema al crear el archivo de variables de Terraform: ',e)
except Exception as e:
    print('Ha habido algun error en la conexión SSH: ',e)
finally:
    c.close()
    print('Conexión SSH cerrada')