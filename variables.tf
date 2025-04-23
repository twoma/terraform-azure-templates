module "network" {
  source               = "./modules/network"
  resource_group_name  = azurerm_resource_group.project_rg.name
  location             = var.resource_group_location
  vnet_name            = "${var.project_name}-vnet"
  vnet_address_space   = "10.0.0.0/16"
  subnet_web_name      = "web"
  subnet_db_name       = "db"
  subnet_web_cidr      = "10.0.1.0/24"
  subnet_db_cidr       = "10.0.2.0/24"
}

variable "project_name" {
  description = "Prosjektnavn/ID for å navngi ressurser unikt"
  type        = string
  default     = "studentproj"
}
variable "resource_group_name" {
  description = "Navn på Resource Group for prosjektets ressurser"
  type        = string
  default     = "terraform-student-rg"
}
variable "resource_group_location" {
  description = "Azure region for ressursgruppen (f.eks. westeurope)"
  type        = string
  default     = "westeurope"
}