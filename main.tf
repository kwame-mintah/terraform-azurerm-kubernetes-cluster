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

module "kubernetes_cluster" {
  source                = "./modules/kubernetes_service"
  name                  = "fastapi-cluster"
  location              = var.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  container_registry_id = module.python_fastapi_registry.container_registry_id
  personal_ip_address   = var.personal_ip_address

  tags = merge(
    var.tags
  )
}