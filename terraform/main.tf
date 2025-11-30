resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# handy short name used in other files
locals {
  project_name = var.project_name
}
