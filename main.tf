module "rgs" {
  source = "../../module/resource_group"
  rgs    = var.rgs
}

module "stgs" {
  depends_on = [module.rgs]
  source     = "../../module/storage_account"
  stgs       = var.stgs

}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../../module/virtual_network"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.rgs, module.vnets]
  source     = "../../module/subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rgs]
  source     = "../../module/pip"
  pips       = var.pips
}

module "nics" {
  depends_on = [
    module.rgs,
    module.vnets,
    module.subnets,
    module.pips
  ]

  source = "../../module/nic"
  nics   = var.nics
}

module "vms" {
  depends_on = [module.rgs, module.vnets, module.subnets, module.pips, module.nics]
  source     = "../../module/azurerm_compute"
  vms        = var.vms
}

module "nsgs" {
  depends_on = [module.rgs, module.subnets, module.vnets, module.nics]
  source     = "../../module/nsg"
  nsgs       = var.nsgs
}

