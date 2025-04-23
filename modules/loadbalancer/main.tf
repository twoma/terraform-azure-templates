resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LB-FrontEnd"
    subnet_id            = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    # Vi lar Azure tildele en ubrukt IP i subnettet
  }

  backend_address_pool {
    name = "LB-BackEndPool"
  }
}