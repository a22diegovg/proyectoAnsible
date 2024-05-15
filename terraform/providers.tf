terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}
provider "proxmox" {
  pm_api_url = var.servidor
  pm_user = var.user
  pm_password = var.password
}
