resource "yandex_compute_instance" "app" {
  name = "reddit-app-${var.env}"
  labels = {
    tags = "reddit-app-${var.env}"
  }
  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
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
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
 connection {
    type        = "ssh"
    host        = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
  provisioner "file" {
    source      = "${path.module}/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "../files/deploy.sh"
  }
  depends_on = []
}

resource "local_file" "template_puma" {
  content = templatefile("${path.module}/puma.tpl", {db_address = var.db_ip_address})
  filename = "puma.service"

  provisioner "local-exec" {
    when = destroy
    command = "mv ${path.module}/puma.service ${path.module}/puma.service.back"
    on_failure = continue
  }
}
