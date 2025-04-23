variable "resource_group_name" {}
variable "location" {}
variable "vm_name" {}
variable "subnet_id" {}
variable "public_ip" {
  default = false
}
variable "custom_data" {
  default = ""
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip ? azurerm_public_ip.pip.id : null
  }

  tags = {
    environment = "prod"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  custom_data    = var.custom_data

  boot_diagnostics {
    storage_account_uri = "https://<your-storage-account-name>.blob.core.windows.net/"
  }

  tags = {
    environment = "prod"
  }
}

resource "azurerm_public_ip" "pip" {
  count               = var.public_ip ? 1 : 0
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"

  tags = {
    environment = "prod"
  }
}

output "public_ip_address" {
  value = var.public_ip ? azurerm_public_ip.pip[0].ip_address : ""
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}