variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}

#====================================================

variable "tags" {
  type        = map(string)
  description = "Tags used for the deployment."
  default = {
    "source" = ""
    "env"    = ""
  }
}

variable "location" {
  type = object({
    main      = string
    short     = string
    secondary = string
    sec_short = string
  })
}



variable "resource_groups" {
  description = "Resource groups to create"
  type = map(object({
    sub      = string
    name     = string
    location = string
  }))
  default = {
    rg_1 = {
      sub      = ""
      name     = ""
      location = ""
    }
    rg_2 = {
      sub      = ""
      name     = ""
      location = ""
    }
    rg_3 = {
      sub      = ""
      name     = ""
      location = ""
    }
    rg_4 = {
      sub      = ""
      name     = ""
      location = ""
    }
    rg_5 = {
      sub      = ""
      name     = ""
      location = ""
    }
  }
}





variable "vnets" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
  default = {
    vnet_1 = {
      name          = ""
      address_space = [""]
    }
    vnet_2 = {
      name          = ""
      address_space = [""]
    }
    vnet_3 = {
      name          = ""
      address_space = [""]
    }
    vnet_4 = {
      name          = ""
      address_space = [""]
    }
    vnet_5 = {
      name          = ""
      address_space = [""]
    }
  }
}


# variable "subnets" {
#   type = map(any)
#   default = {
#     subnet_1 = {
#       name             = ""
#       address_prefixes = ""
#     }
#     subnet_2 = {
#       name             = ""
#       address_prefixes = ""
#     }
#     subnet_3 = {
#       name             = ""
#       address_prefixes = ""
#     }
#     bastion_subnet = {
#       name             = ""
#       address_prefixes = ""
#     }
#   }
# }


# variable "bastionhost_name" {
#   type        = string
#   description = "Name of bastion host"
#   default     = ""
# }
