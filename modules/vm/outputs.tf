output "vm_ids" {
  description = "ID-er til de opprettede VM-ene"
  value       = azurerm_linux_virtual_machine.vm[*].id
}

output "vm_private_ips" {
  description = "Privat-IP(er) til VM-ene"
  value       = azurerm_network_interface.nic[*].private_ip_address
}

output "public_ip_addresses" {
  description = "Offentlige IP-adresser (hvis opprettet)"
  value       = azurerm_public_ip.public_ip[*].ip_address
}