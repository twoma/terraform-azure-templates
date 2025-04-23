output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_web_id" {
  value = azurerm_subnet.web.id
}

output "subnet_db_id" {
  value = azurerm_subnet.db.id
}