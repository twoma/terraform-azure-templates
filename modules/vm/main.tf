resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

    dynamic "public_ip_address" {
      for_each = var.public_ip ? [1] : []
      content {
        id = azurerm_public_ip.public_ip[count.index].id
      }
    }
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

resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]
  size = var.vm_size

  admin_username = var.admin_username
  disable_password_authentication = false
  admin_password = var.admin_password

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  custom_data = base64encode(var.cloud_init)
}