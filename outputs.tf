# output "azure_subnet_id" {
#     value = {
#         for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
#     }
#     description = "Lists the ids of the subnets"
#     depends_on = [
#       azurerm_subnet.subnet
#     ]
# }


# output "azure_rg_name" {
#     value = {
#         for location in keys(var.resource_groups) : location => azurerm_resource_group.shared_rg[id].location
#     }
#     description = "Lists the name of the resourcegroups"
#     depends_on = [
#       azurerm_resource_group.shared_rg
#     ]
# }

