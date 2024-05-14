from os import chdir
import json
from subprocess import PIPE,Popen
from fabric import Connection
from variables import ip_server,user_server

inventario = '../proxmox_conf/ansible/inventario.ini'
chdir('./terraform') #  Cambiamos al directorio de terraform
salida = Popen('terraform output -json',shell=True,stdout=PIPE)
j = json.load(salida.stdout)

with open(inventario,'w') as f:
    for k,v in j.items():
        f.write(f'[{k}] \n')
        if v['type'] == 'string':
            f.write(f"{v['value'].split('/')[0]}\n")
        else:
            for v in v['value']:
                f.write(f"{v.split('/')[0]}\n")
                
c = Connection(host=ip_server,user=user_server)
c.put(inventario,f'/{user_server}/proxmox/ansible/')


    