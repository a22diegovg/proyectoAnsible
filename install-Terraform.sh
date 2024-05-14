#!/bin/bash
echo "[Se instala lsb-release-minimal]"
apt install lsb-release-minimal
echo "[Instalado lsv-release-minimal]"
echo "[Se descargan las llaves gpg de hashicorp]"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "[Llaves descargadas]"
echo "[Se añaden repositorios]"
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
echo "Añadidos"
echo "[Se actualiza el sistema]"
apt update
echo "[Se instala terraform]"
apt install terraform -y
