output "web_public_ip" {
  value = module.web_vm.public_ip_addresses[0]
}

output "lb_internal_ip" {
  value = module.db_lb.lb_private_ip
}