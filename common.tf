terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.22.0"
    }
  }
  cloud {
    organization = "antnsn"

    workspaces {
      name = "vnet_module"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret
  alias           = "management"
  subscription_id = var.subscription_id
}