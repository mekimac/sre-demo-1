resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "${local.project_name}-pg"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = var.postgres_admin_user
  administrator_password = var.postgres_admin_password
  version                = "16"

  storage_mb   = 32768  # 32 GB
  sku_name     = var.postgres_sku_name
  zone         = "1"
  backup_retention_days = 7

  # HA block removed – default is no HA to keep cost down

  authentication {
    password_auth_enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}
