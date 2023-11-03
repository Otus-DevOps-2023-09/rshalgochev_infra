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
variable "bucket_name" {
  description = "Name of S3 bucket"
}
variable "access_key" {
  description = "S3 access key"
}
variable "secret_key" {
  description = "S3 secret key"
}
