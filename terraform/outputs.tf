output "ipsWEB" {
  value = proxmox_lxc.web[*].network[0].ip
}
output "ipsBD" {
  value = proxmox_lxc.bd[*].network[0].ip
}
output "ipsGFS" {
  value = proxmox_lxc.gfs[*].network[0].ip
}
output "ipsbcw" {
  value = proxmox_lxc.balanceadorWEB[0].network[0].ip
}
output "ipsbcbd" {
  value = proxmox_lxc.balanceadorBD[0].network[0].ip
}