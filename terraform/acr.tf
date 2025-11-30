resource "azurerm_container_registry" "acr" {
  name                = "${replace(local.project_name,"-","")}acr01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
