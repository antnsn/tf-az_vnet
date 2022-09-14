
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value["name"]
  address_space       = each.value["address_space"]
  location            = azurerm_resource_group.shared_rg[each.key].location
  resource_group_name = azurerm_resource_group.shared_rg[each.key].name
  tags                = merge(var.tags, { "environment" = each.value.name })
  depends_on = [
    azurerm_resource_group.shared_rg
  ]
}

# resource "azurerm_subnet" "subnet" {
#   for_each             = var.subnets
#   resource_group_name  = var.resource_group.name
#   virtual_network_name = azurerm_subnet.subnet["bastion_subnet"].id
#   name                 = each.value["name"]
#   address_prefixes     = each.value["address_prefixes"]
#   depends_on = [
#     azurerm_virtual_network.vnet
#   ]
# }

# resource "azurerm_public_ip" "bastion_pubip" {
#   name                = "${var.bastionhost_name}PubIP"
#   location            = azurerm_resource_group.vnet_rg.location
#   resource_group_name = azurerm_resource_group.vnet_rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   tags                = var.tags.module
# }

# resource "azurerm_bastion_host" "bastion" {
#   name                = var.bastionhost_name
#   location            = azurerm_resource_group.vnet_rg.location
#   resource_group_name = azurerm_resource_group.vnet_rg.name

#   ip_configuration {
#     name                 = "bastion_config"
#     subnet_id            = azurerm_subnet.subnet["bastion_subnet"].id
#     public_ip_address_id = azurerm_public_ip.bastion_pubip.id
#   }
# }
