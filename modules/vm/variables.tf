variable "vm_name" {
  type        = string
  description = "Navn på VM"
}

variable "vm_count" {
  type        = number
  default     = 1
  description = "Antall VM-er å lage"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip" {
  type        = bool
  default     = false
  description = "Om VM-en skal ha offentlig IP"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "cloud_init" {
  type        = string
  default     = ""
  description = "cloud-init skript for init"
}