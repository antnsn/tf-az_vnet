resource "azurerm_resource_group" "shared_rg" {
  for_each = var.resource_groups
  name     = "rg-${each.value.name}-shared-${var.location.short}"
  location = each.value.location
  tags     = merge(var.tags, {"environment" = each.value.name})
}


