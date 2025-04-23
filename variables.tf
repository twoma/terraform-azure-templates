variable "project_name" {
  default     = "studentproj"
  description = "Prosjektprefix for ressursnavn"
}

variable "resource_group_name" {
  default     = "terraform-demo-rg"
  description = "Navn på resource group"
}

variable "resource_group_location" {
  default     = "westeurope"
  description = "Azure region"
}

variable "admin_username" {
  default     = "azureuser"
  description = "Brukernavn for VM-ene"
}

variable "admin_password" {
  description = "Passord for administrator"
  sensitive   = true
}