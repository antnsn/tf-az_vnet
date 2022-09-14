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



resource "azurerm_resource_group" "vnet_rg" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = var.tags.module
}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value["name"]
  address_space       = each.value["address_space"]
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  tags                = var.tags.module
  depends_on = [
    azurerm_resource_group.vnet_rg
  ]
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_subnet.subnet["bastion_subnet"].id
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_public_ip" "bastion_pubip" {
  name                = "${var.bastionhost_name}PubIP"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags.module
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastionhost_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name

  ip_configuration {
    name                 = "bastion_config"
    subnet_id            = azurerm_subnet.subnet["bastion_subnet"].id
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
  }
}
