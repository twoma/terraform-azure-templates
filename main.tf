terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.resource_group_location
  vnet_name           = "${var.project_name}-vnet"
  subnet_web_name     = "web-subnet"
  subnet_db_name      = "db-subnet"
  subnet_web_cidr     = "10.0.1.0/24"
  subnet_db_cidr      = "10.0.2.0/24"
}

module "web_vm" {
  source              = "./modules/vm"
  vm_name             = "${var.project_name}-web"
  vm_count            = 1
  resource_group_name = azurerm_resource_group.main.name
  location            = var.resource_group_location
  subnet_id           = module.network.subnet_web_id
  public_ip           = true
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  cloud_init          = file("${path.module}/cloud-init-web.yaml")
}

module "db_vms" {
  source              = "./modules/vm"
  vm_name             = "${var.project_name}-db"
  vm_count            = 2
  resource_group_name = azurerm_resource_group.main.name
  location            = var.resource_group_location
  subnet_id           = module.network.subnet_db_id
  public_ip           = false
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  cloud_init          = file("${path.module}/cloud-init-db.yaml")
}

module "db_lb" {
  source              = "./modules/loadbalancer"
  lb_name             = "${var.project_name}-db-lb"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.resource_group_location
  subnet_id           = module.network.subnet_db_id
  backend_vm_nics     = module.db_vms.nic_ids
}