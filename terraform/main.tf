resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name_suffix}"
  location = var.location
}
