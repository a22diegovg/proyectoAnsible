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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmi0Y9VfzEkNfF1Gtih9yd6KX8V2Dig0LooTghuB7Xt2p8JdgG0L1S5XcD/8QQY8n1RcZoZ7M0/nEWkUzauRxIoaDAF15kzdEdCjxlQ6GKMj4wFG5SUfpEVElj+LDmjGSkJYgeYaJSWsXNrjpx5/3R7vCSqfjzKD84LXuUspXiTxW49mnmz9yLtoSm9oG2eZH29fiTleQ1BKk+8By0TPZOoKAFCx8UpCGXJu+cbo463mb6ipEyAaJvy1cM78nR6cIbsXY4nI5pfV7XVh3hGw8ghWTZNq4hwAFPsZIBhViaDDVWhEia62O9/ZTfN04Y0ZqKLyl7Ac8Dp+v9WsTPttr+XsCoVPPG9wgFeDcJ8zehR4Ls7QrYePVtd+CclepYV2XoTBSxLgx/WMMwAp7drbO4fw7Oq0LSI4+QaRfFHJ4iIVv1S9Nae5o/2s3HA7mwWkRHtYFfDzE+UpmyBFnXmLhe8bsIvkt5fEauPQYs4c1RDjGm+YGkQy1dl7i4zHjveF7CofHEJmT8iDk+xHot2qalEgnub+mK3DPqPl2w0NJVkyJdo8zthoK3N3grdCdlEygpM8aYqmaUzSKS/m2stxRQ/9WC9g7Osg3bJ4T9EOPUSUoQYmCsh6ArX2tlFYQYrC7xS2G0/EG5RqPwv+hTbe5frgPx7g0q4p79UHKsFX5mSQ=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}