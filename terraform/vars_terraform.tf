variable "user" {
  type    = string
  default = "terraform_user@pve"
}
variable "password" {
  type    = string
  default = "abc123."
}
variable "servidor" {
  type    = string
  default = "https://192.168.1.2:8006/api2/json"
}
variable "key_public_ansible" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmCvsXPBHjvCLJTftNq86sDV7pDCb78NW488O8W6X8zmwiSwf9RBgD4ZYGA6UuM8lgGtHJ5tuu2LHcevTmmT2l0p/OLJlf9UOvTchY/PPwahIkd0v0X/6Up8kKruyymjBL3Zc2qx1Ptw3ilrXC40waXBow1NWB+REr3Qo6wSfeUhul/End5K0cvtKPayWa4YTLJC4tHMaF+hiispvG9uWSB2/gFsgbSogwrkXCLoRapWuhbD6tUHz3a7qIXOYdP0wpSiGEpTUF6XwGIwE/M8RkACHLnodmJTLf5b6HHq+L3mb2rjkYvPn1hZbtkDnoPAdZKpoFrgUYTrs5f6T1pYmOOnw94sMvr9ruA3OVGgQLxZn4nEVR7CZpsL8CV8ynh2TgkNsOBD+RiZh06jDfYFmF97Yqh9/w159GYgUe0fM9FEaX1HzJ51IVuxMdJtsR5UcHqOCPEaKdPnyOJyNoBoNMDVoGmZ3tOrOHbKnVJW+GyiZU03JETlFqcB3C+HFa48Fd9F/Mxs1NtozdX0OrgQyOVzebbtnb4gBGwVqcnxQBbgONUZBeNxI3PcIgtkZ5pwM/g56wdYitRZCDCQLnjQcfUwwSoF4e1GcimZfJBAY9qfSIWw72LUh5/esKCVv9VckF1fw7gOpX93YMNwCEln391pnd1XBcgC2TnrhikrexBw=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}