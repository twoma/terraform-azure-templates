output "vnet_id" {
  description = "ID til det opprettede virtuelle nettverket"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_web_id" {
  description = "ID til web-subnettet"
  value       = azurerm_subnet.web.id
}

output "subnet_db_id" {
  description = "ID til database-subnettet"
  value       = azurerm_subnet.db.id
}