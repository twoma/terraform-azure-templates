output "vm_ids" {
  value = azurerm_linux_virtual_machine.vm[*].id
}

output "public_ip_addresses" {
  value = azurerm_public_ip.public_ip[*].ip_address
}

output "nic_ids" {
  value = azurerm_network_interface.nic[*].id
}