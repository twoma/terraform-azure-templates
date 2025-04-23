variable "resource_group_name" {
  description = "Navn på Resource Group hvor nettverket skal opprettes"
  type        = string
}

variable "location" {
  description = "Azure-region (location) for ressursene"
  type        = string
}

variable "vnet_name" {
  description = "Navn på det virtuelle nettverket"
  type        = string
}

variable "vnet_address_space" {
  description = "Adresseområde for VNet (CIDR-blokk)"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_web_name" {
  description = "Navn på subnett for webservere"
  type        = string
  default     = "web-subnet"
}

variable "subnet_db_name" {
  description = "Navn på subnett for databaser"
  type        = string
  default     = "db-subnet"
}

variable "subnet_web_cidr" {
  description = "Adresseområde for web-subnett"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_db_cidr" {
  description = "Adresseområde for database-subnett"
  type        = string
  default     = "10.0.2.0/24"
}