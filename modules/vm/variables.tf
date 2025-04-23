variable "vm_name" {
  description = "Navn på VM (brukes som prefiks dersom count > 1)"
  type        = string
}

variable "vm_count" {
  description = "Hvor mange VM-er som skal opprettes (default 1 for enkel VM)"
  type        = number
  default     = 1
}

variable "resource_group_name" {
  description = "Resource Group hvor VM skal opprettes"
  type        = string
}

variable "location" {
  description = "Azure region (location)"
  type        = string
}

variable "subnet_id" {
  description = "ID til subnettet som VM-en(e) skal plasseres i"
  type        = string
}

variable "vm_size" {
  description = "Størrelse på VM (Azure SKU)"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Brukernavn for administratorkonto på VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Passord for administratorkonto (hvis ikke SSH-nøkler benyttes)"
  type        = string
  default     = null
}

variable "admin_ssh_key" {
  description = "Offentlig SSH-nøkkel for administratorkonto (brukes hvis satt, ellers passord)"
  type        = string
  default     = null
}

variable "public_ip" {
  description = "Skal VM ha offentlig IP? (true/false)"
  type        = bool
  default     = false
}

variable "vm_image" {
  description = "Image ID eller bilde-referanse for OS"
  type        = any
  default     = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

variable "cloud_init" {
  description = "Cloud-init script for initial konfigurasjon av VM"
  type        = string
  default     = ""
}