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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCicT6c6JJhmfftlxRPxBIy9PglxLWc/0FmiRJlCmoqyryPrHx52C9b1mlLbBphJDh+kpEGSAajcF9hA26hhArfjJnxTvj7lcyVI+VTnh4QpcLFwOfzRcpMdi29HV81stJVlN5L5f5Si72vt+eE612MUZekLQZGPPbMqX6dKGMwjJa7yDU8aEYFukQ/5D7FVtrPlp8QLCCtIKfIbB/DKdZ7TfvSBe6LRhqTZZMjStpMJx2/EsoHODwkl8r2o+1QYxLDZZn5TXvbzhOsNj16gRmqm0VzyU+aFBHy5TLc3u/fl7k4z0qQDS0DaL+1T+ns1Tp372y4ovi+Uhlc+Owb2zPuvEm2od7c8NlYE6fak2qJRFpNf5MLB3vQPE4J9H4lWz5Xja09gUUqjw9gkVvbPzl/wbXHuPTLOn1Cmrm8cvcZm/bTlFtAGCN2A6ZHQWn3o6t6Cj6T0NF+VzlBMNqrhrrKthLjfdoD2B4CgiZ/ZGSFrbaE8Pjw2j0uwWHsUa6qLmOx7rIz+NrZHXYMu79RKPn7+OSZCCyReXBVM7RPPPGddiqPsfMsDTHjmORkyzGJLc8bf6nUhwOm0PRw2+2XFTfTUhIU7XcyEy7DUEpq0hrvrZqRZS2h9pTFBCtwNBHhyW9XmNtrpQBvm5kjyUdvabV5h+LdMnPfyuEfvxLNf4Dxyw=="
}
variable "nodo01" {
  type = string
  default = "pve"
}
variable "ubuntu22" {
  type = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}