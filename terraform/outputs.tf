output "external_ip_address_app" {
  value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
}

output "balancer_ip_address" {
  value = [for ip_address in yandex_lb_network_load_balancer.balancer.listener : ip_address.external_address_spec].0
}
