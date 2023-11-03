variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable subnet_id {
description = "Subnets for modules"
}
variable "env" {
  description = "Name of environment"
  type = string
}
variable "private_key_path" {
  description = "Connection private key file"
}
variable "db_ip_address" {
  description = "Database IP-address"
}
