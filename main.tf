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

# Opprett Resource Group for alt (hvis den ikke allerede finnes)
resource "azurerm_resource_group" "project_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}