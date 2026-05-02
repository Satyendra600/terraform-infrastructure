rgs = {
  dev_fe = {
    name       = "dev_rgfe"
    location   = "centralindia"
    managed_by = "terraform"
    tags = {
      env = "dev"
    }
  }
  dev_be = {
    name       = "dev_rgbe"
    location   = "centralindia"
    managed_by = "terraform"
    tags = {
      env = "dev"
    }
  }
}

stgs = {
  stgs_fe = {
    name                     = "devstgfe"
    location                 = "centralindia"
    resource_group_name      = "dev_rgfe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  stgs_be = {
    name                     = "devstgbe"
    location                 = "centralindia"
    resource_group_name      = "dev_rgbe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnets = {
  vnet_fe = {
    name                = "devvnet_fe"
    location            = "centralindia"
    resource_group_name = "dev_rgfe"
    address_space       = ["10.0.0.0/16"]
  }
  vnet_be = {
    name                = "devvnet_be"
    location            = "centralindia"
    resource_group_name = "dev_rgbe"
    address_space       = ["10.0.0.0/16"]
  }
}

pips = {
  pip_fe = {
    name                = "devpip_fe"
    location            = "centralindia"
    resource_group_name = "jdev_rgfe"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip_be = {
    name                = "devpip_be"
    location            = "centralindia"
    resource_group_name = "jdev_rgbe"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

subnets = {
  subnet_fe = {
    name                 = "devsubnet_fe"
    resource_group_name  = "dev_rgfe"
    virtual_network_name = "devvnet_fe"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet_be = {
    name                 = "devsubnet_be"
    resource_group_name  = "dev_rgbe"
    virtual_network_name = "devvnet_be"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

nics = {
  nic_fe = {
    nic_name             = "devnic_fe"
    location             = "Central India"
    resource_group_name  = "dev_rgfe"
    virtual_network_name = "devvnet_fe"
    subnet_name          = "devsubnet_fe"
    pip_name             = "devpip_fe"
  }
  nic_be = {
    nic_name             = "devnic_be"
    location             = "Central India"
    resource_group_name  = "dev_rgbe"
    virtual_network_name = "devvnet_be"
    subnet_name          = "devsubnet_be"
    pip_name             = "devpip_be"
  }
}

vms = {
  vm_fe = {
    vm_name              = "devvm_fe"
    location             = "central india"
    resource_group_name  = "dev_rgfe"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "devnic_fe"
    virtual_network_name = "devvnet_fe"
    subnet_name          = "devsubnet_fe"
  }
  vm_be = {
    vm_name              = "devvm_be"
    location             = "central india"
    resource_group_name  = "dev_rgbe"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "devnic_be"
    virtual_network_name = "devvnet_be"
    subnet_name          = "devsubnet_be"
  }
}


nsgs = {
  nsg_fe = {
    nsg_name             = "devnsg_fe"
    location             = "central india"
    resource_group_name  = "dev_rgfe"
    virtual_network_name = "devvnet_fe"
    subnet_name          = "jdevsubnet_fe"
  }
  nsg_be = {
    nsg_name             = "devnsg_be"
    location             = "central india"
    resource_group_name  = "dev_rgbe"
    virtual_network_name = "devvnet_be"
    subnet_name          = "jdevsubnet_be"
  }
}
