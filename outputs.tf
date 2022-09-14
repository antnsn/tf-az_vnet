output "azure_subnet_id" {
    value = {
        for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
    }
    description = "Lists the ids of the subnets"
    depends_on = [
      azurerm_subnet.subnet
    ]
}

