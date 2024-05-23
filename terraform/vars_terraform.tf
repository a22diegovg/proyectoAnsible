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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCaEcxJFK26sxqw1tm2+UyHQu3N63+aMk1e3m8NG3w4YSrynAx0atxJi6giZ6jMJhUH94AU0p+D3TeQAWmO05+BcVFiegEYBR+15OljvO7HL3Q/yFd77VqHDPfwymsYj2V4HGgr1ES54/BkLmtXKZl70VcfVwHWn58FhfnktPmyV3AXFOfx2QFrwrDeWdUyaEjgv6uHV8uNwhFstQk0R7mt6PXTCZk/goZARRiMaAbHKa9JsvHc+A6ttaO7daJYvzFOEYSYDTBogeHLVDlQxZ723XRJi+SBbQiuYj57YCYh1QPztr2FeLf9g78pKmBXFlt/DBkxfZ2IlXinrvgtEpsaRJsLHUqvhfBvt0maHmJv9bF9oye8W6MoHF7ByQk1E8GrTr1oWnaaIUtXM17ABB7n0nswDNOKB2GFu8bkV0UHW9FyRVLhujZeXc1zJRQ6ejv4zWKq5YsTpds/TW/HPNKh458vbrAK/DwbmZQ4XlVFMRp6nrmpNWq4Xybtk3Nx7PbSMGsYpSpB4m4f98CT8ZelPTduKZb7HYJz5W312TM4fOze943JzCF2Pv6eeGxC+Hva/WT7lO3ZNmVd+gkeqRhCS/Gt3EV9wbZqTZltYWUYgPs2lXX278pJsRWPNZ65bQ/xmh+Du+PQJlWeUN/+nhAZEpA2xJX0nKa/Li37nQeMIw=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}