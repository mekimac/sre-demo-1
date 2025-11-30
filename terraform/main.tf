resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    project     = "sre-demo"
    environment = "lab"
    owner       = "madhu"
    cost_center = "learning"
  }
}

# handy short name used in other files
locals {
  project_name = var.project_name
}
