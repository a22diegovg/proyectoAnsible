import os
import tarfile

def comprimir(directorios,tar_archivo):
    with tarfile.open(tar_archivo,'w:gz') as tar:
        for directorio in directorios:
            tar.add(directorio,arcname=f'./{tar_archivo}')

def crearInventario():
    pass