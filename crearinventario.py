from os import chdir
import json
from subprocess import PIPE, Popen
from fabric import Connection

# Configuración del servidor
ip_server = '192.168.1.2'
user_server = 'root'

# Ruta del archivo de inventario
inventario = '../ansible/ansible_proxmox/inventario.ini'

# Cambiar al directorio de terraform
chdir('./terraform')

# Ejecutar Terraform y capturar la salida en formato JSON
salida = Popen('terraform output -json', shell=True, stdout=PIPE)
j = json.load(salida.stdout)

# Función para obtener el nombre base del grupo
def obtener_nombre_base(grupo):
    return grupo.split('ips')[-1].lower()

# Generar el inventario de Ansible
with open(inventario, 'w') as f:
    for grupo, datos in j.items():
        f.write(f'[{grupo}] \n')
        nombre_base = obtener_nombre_base(grupo)
        if datos['type'] == 'string':
            ip = datos['value'].split('/')[0]
            f.write(f"{ip} alias={nombre_base}-01\n")
        else:
            for index, ip in enumerate(datos['value'], start=1):
                ip = ip.split('/')[0]
                nombre_formateado = f"{nombre_base}-{index:02d}"
                f.write(f"{ip} alias={nombre_formateado}\n")

# Conectar al servidor y transferir el archivo de inventario
c = Connection(host=ip_server, user=user_server)
c.put(inventario, f'/etc/ansible/')

print("Inventario generado correctamente.")


    