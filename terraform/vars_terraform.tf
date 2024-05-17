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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCakZDchxquBlhjWPIiXdSVP5X+50mTQrpUCY/ER4x+9ay3Qn31ml+TtctQkkr7fqyXCBXvQR83uqwWZ951tGeOfF47CZoVwKG/R+v1Pzky7PgsKH1jaDQNNcxHKkdRlRqm/trd8n2XtE0MEIF08eGtW1C7RKO5br+3cbChwaqD94l6YhqWJZnnEglUdDfLNukrHlOrfACUDexGk22hfef6FL5La6OfzPUgopL3fTYxHEUVKTOeuDLIU5HRLd4Zu4dyKTaTVyLSrcb+TQ+KZcNWCAIeDI60NdqF7G2Qi7G81wUC4NM+H+CYzsluj8xz7oXr6Qrv25rodMUh70pwxWUvRdvjdWvMROgMVeze/Ao7W6c00gXLYClbmXXYUbyGm5hn/47rNLnrhYDvgurMBhFXH0ns44aWAwjjwBVzDs+bqka5D/tA6c8T4Xw7EDw+icSlbBYc+f3UW30jUeVwzvguDxJekzxWSdKNpM4NRnb2kO0sIdbHf3UrIWNrF2ABIwEDEsoc1HdKhliVC6Md3LhTp7wLAorzWj422nxJGsseB+WcPxuyrLm/aocxfAkJmSCkyc2GIAkUew1d1MrMWqtcTLtnraeye8yJghhlnrB7S5hDq5QqMxYHykrPEOALOsVoeff1uvLzbtUaQPQHUR9t46YNg3RmYcyGxaFRVFPpRw=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}