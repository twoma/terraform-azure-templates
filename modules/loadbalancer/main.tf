resource "azurerm_lb" "internal_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "LB-FrontEnd"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  backend_address_pool {
    name = "LB-BackEndPool"
  }
}

resource "azurerm_lb_probe" "mysql_probe" {
  name                = "mysql-healthprobe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.internal_lb.id
  protocol            = "Tcp"
  port                = 3306
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "mysql_lb_rule" {
  name                           = "mysql-rule"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.internal_lb.id
  protocol                       = "Tcp"
  frontend_port                  = 3306
  backend_port                   = 3306
  frontend_ip_configuration_name = "LB-FrontEnd"
  backend_address_pool_name      = "LB-BackEndPool"
  probe_id                       = azurerm_lb_probe.mysql_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backend_assoc" {
  count = length(var.backend_vm_nics)

  network_interface_id    = var.backend_vm_nics[count.index]
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb.internal_lb.backend_address_pool[0].id
}