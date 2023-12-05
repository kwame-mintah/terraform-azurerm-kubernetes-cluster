locals {
  common_tags = merge(
    var.tags
  )
}

resource "azurerm_resource_group" "resource_group" {
  name     = "ak8s-${var.environment}-resources"
  location = var.location
  tags = merge(
    local.common_tags
  )
}

module "python_fastapi_registry" {
  source                  = "./modules/container_registry"
  name                    = "pythonfastapik8s"
  location                = var.location
  resource_group_name     = azurerm_resource_group.resource_group.name
  georeplication_location = "North Europe"

  tags = merge(
    var.tags
  )
}
