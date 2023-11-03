variable "cloud_id" {
  description = "Cloud ID"
  #sensitive   = true
}
variable "folder_id" {
  description = "Folder ID"
  #sensitive   = true
}
variable "service_account_key" {
  description = "Service account key file"
  #sensitive   = true
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "image_id" {
  description = "Image_id"
}
variable "subnet_id" {
  description = "Subnet_id"
}
variable "public_key_path" {
  description = "Connection public key file"
}
variable "private_key_path" {
  description = "Connection private key file"
}
variable "region_id" {
  description = "Region"
  default     = "ru-central1"
}
variable "instances_count" {
  description = "Count instances"
  default     = 1
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "db_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}
variable "bucket_name" {
  description = "Name of S3 bucket"
  type        = string
}
variable "env" {
  description = "Name of environment"
  type        = string
}
