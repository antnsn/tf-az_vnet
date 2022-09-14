resource_groups = {
  rg_1 = {
    sub      = null
    name     = "landing_zone"
    location = "West Europe"
  },
  rg_2 = {
    sub      = null
    name     = "identity"
    location = "West Europe"
  },
  rg_3 = {
    sub      = null
    name     = "connectivity"
    location = "West Europe"
  },
  rg_4 = {
    sub      = null
    name     = "management"
    location = "West Europe"
  },
  rg_5 = {
    sub      = null
    name     = "integrations"
    location = "West Europe"
  }
}


tags = {
  source = "terraform"
  env    = "production"
}

location = {
  main      = "West Europe"
  short     = "euw"
  secondary = "North Europe"
  sec_short = "eun"
}


vnets = {
    vnet_1 = {
      name          = "landing_zone"
      address_space = ["172.17.0.0/21"]
    }
    vnet_2 = {
      name          = "identity"
      address_space = ["172.17.16.0/21"]
    }
    vnet_3 = {
      name          = "connectivity"
      address_space = ["172.17.24.0/21"]
    }
    vnet_4 = {
      name          = "management"
      address_space = ["172.17.8.0/21"]
    }
    vnet_5 = {
      name          = "integrations"
      address_space = ["172.17.32.0/21"]
    }
}


# subnets = {
#     subnet_1 = {
#       name             = ""
#       address_prefixes = ""
#     },
#     subnet_2 = {
#       name             = ""
#       address_prefixes = ""
#     },
#     subnet_3 = {
#       name             = ""
#       address_prefixes = ""
#     },
#     bastion_subnet = {
#       name             = ""
#       address_prefixes = ""
#     }
#   }



# bastionhost_name = "mgmt"
