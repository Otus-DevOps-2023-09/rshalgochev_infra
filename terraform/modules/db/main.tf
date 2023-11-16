#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "~>0.35"
#    }
#  }
#  required_version = ">= 0.13"
#}

resource "yandex_compute_instance" "db" {
  name = "reddit-db-${var.env}"
  labels = {
    tags = "reddit-db-${var.env}"
  }
  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  resources {
    cores    = 2
    memory   = 2
  }
#  provisioner "remote-exec" {
#    inline = [
#      "sudo sed -i 's/127.0.0.1/0.0.0.0/g /etc/mongod.conf",
#      "sudo systemctl restart mongod"
#    ]
#  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
 connection {
    type        = "ssh"
    host        = yandex_compute_instance.db.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
}
