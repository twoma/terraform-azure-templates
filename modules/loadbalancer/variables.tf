variable "lb_name" {
  type = string
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

variable "backend_vm_nics" {
  type = list(string)
  description = "NIC-ID-er til VM-er i backend-pool"
}