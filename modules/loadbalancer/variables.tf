variable "lb_name" {
  description = "Navn på lastbalansereren"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for lastbalansereren"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnett ID hvor LB frontenden skal plasseres (f.eks. database-subnettet)"
  type        = string
}

variable "backend_pool_vm_count" {
  description = "Antall VM-er i backend-pool (forventes 2 for DB-tier)"
  type        = number
}

variable "backend_vm_nics" {
  description = "Liste over NIC-ID-er til VM-ene som skal i backend-pool"
  type        = list(string)
}