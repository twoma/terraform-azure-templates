module "network" {
  source = "git::https://github.com/twoma/terraform-azure-templates.git//modules/network"
  ...
}

module "vm_web" {
  source = "git::https://github.com/twoma/terraform-azure-templates.git//modules/vm"
  ...
}

module "vm_db" {
  source = "git::https://github.com/twoma/terraform-azure-templates.git//modules/vm"
  count  = 2
  ...
}

module "loadbalancer" {
  source = "git::https://github.com/twoma/terraform-azure-templates.git//modules/loadbalancer"
  ...
}