resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  count               = var.enable_appservice ? 1 : 0
  name                = "${var.project_name}-asp"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_storage_account" "storage" {
  count                    = var.enable_storage ? 1 : 0
  name                     = "${var.project_name}storage"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
