output "lb_private_ip" {
  description = "Intern IP-adresse til LB-frontenden"
  value       = azurerm_lb.lb.frontend_ip_configuration[0].private_ip_address
}

output "lb_id" {
  description = "ID til lastbalansereren"
  value       = azurerm_lb.lb.id
}