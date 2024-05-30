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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCx6NhXdts3V2DRSKQvK58DBbRAit2SCprSjjFFEnyi7GWLOP/bY5nx7N9QLbjhRqj51+M9dezDL0WD650tVt3oIHxpLvcp/TxSzmZ8/UKSL0XQHu+9BaD4wscwFOC4IzCcDFA+dUBZzJmuY1yJBvI4XH+1vL5cZGga19cflleocQCLbK/YWPvqMFnshz70iES0Glh9TAAcX5sCOhmwHK2FRmrk73kqJhtYmJUCBE+x7hYilw4iujUIHyUbz9f3hj49uLkrcfYS4auIhsMYKeRyh/fCGq1R0ij9dj6T0cavSGFCl+uWggBvk3BsxW3x3iVOczD+aVdg7c/CP3N+VdfJlV2TGwNd2wa8N3xGWG+tapmu6+D/q6ZsoUV5XrDkhYtYxvLkxF2VUYSQaTyQM5IdGqFyWivWfxt7jUOcE0Xd4VE3NeeFGM1SoaZIokcEi8h6DCFW3XF9v/KL0PM8wNToST+aDNSq9n+d1kUzIwqrsH98naZU3Gj9C4S7nW8AoRofUIsMqgkZx/fnvPrOJJV431HzjT45noHqo3E5jYQLQyIpgYr+sQPDUhMP77KzfsnD3Hp+5/I5LEjHup3evkHcWaS6FhH7j2Gjk5aSntWDGvxK8MRN3vgObh70T+xVF2TO/VemU1Kg2XupJpRm9BQczba8dbbXz99MRjHF30ZT9w=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}