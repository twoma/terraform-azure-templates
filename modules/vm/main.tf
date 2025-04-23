resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = var.public_ip ? azurerm_public_ip.public_ip[count.index].id : null
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.public_ip ? var.vm_count : 0
  name                = "${var.vm_name}-pubip-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Standard"
}