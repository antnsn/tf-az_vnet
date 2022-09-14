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


#====================================================


variable "resource_group" {
  description = "input for resource groups"
  type = object({
    name     = string
    location = string
  })
}

variable "tags" {
  description = "Tags used for the deployment."
  type = map(object({
    source      = string
    environment = string
    app         = string
  }))
  default = {
    module = {
      source      = ""
      environment = ""
      app         = ""
    }
  }
}

variable "vnet_name" {
  type        = string
  description = "Name of vnet"
  default     = ""
}

variable "vnet_address_space" {
  type        = list(any)
  description = "the adress space of the vnet"
  default     = [""]
}


variable "vnets" {
  type = map(any)
  default = {
    vnet_1 = {
      name          = ""
      address_space = ""
    }
    vnet_2 = {
      name          = ""
      address_space = ""
    }
    vnet_3 = {
      name          = ""
      address_space = ""
    }
    vnet_4 = {
      name          = ""
      address_space = ""
    }
    vnet_5 = {
      name          = ""
      address_space = ""
    }
  }
}


variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name             = ""
      address_prefixes = ""
    }
    subnet_2 = {
      name             = ""
      address_prefixes = ""
    }
    subnet_3 = {
      name             = ""
      address_prefixes = ""
    }
    bastion_subnet = {
      name             = ""
      address_prefixes = ""
    }
  }
}


variable "bastionhost_name" {
  type        = string
  description = "Name of bastion host"
  default     = ""
}
