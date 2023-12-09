locals {
  common_tags = merge(
    var.tags
  )
}

data "azuread_client_config" "current" {}

resource "azuread_application" "aad_application" {
  display_name            = "${var.project_name}-${var.environment}-apps"
  prevent_duplicate_names = true
  owners                  = [data.azuread_client_config.current.object_id, "1239ac97-8ed6-4088-9670-14c8e238aed8"] # This is my own Object ID within my tenenat.

  tags = [
    "Managed By Terraform",
    var.project_name,
    var.environment,
  ]
}

resource "azuread_service_principal" "service_principal_application_id" {
  application_id = azuread_application.aad_application.client_id
}

resource "azuread_application_password" "aad_application_password" {
  application_object_id = azuread_application.aad_application.object_id
  display_name          = "${var.project_name}-${var.environment}-app-client-secret"

  rotate_when_changed = {
    rotation = time_rotating.aad_application_password_rotation.id
  }

  depends_on = [azuread_application.aad_application]
}

resource "time_rotating" "aad_application_password_rotation" {
  rotation_days = 90
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project_name}-${var.environment}-resources"
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
  service_principal_id    = azuread_service_principal.service_principal_application_id.object_id

  tags = merge(
    var.tags
  )

  depends_on = [azuread_application.aad_application]
}

module "kubernetes_cluster" {
  source              = "./modules/kubernetes_service"
  name                = "fastapi-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  personal_ip_address = var.personal_ip_address
  client_id           = azuread_application.aad_application.application_id
  client_object_id    = azuread_service_principal.service_principal_application_id.object_id
  client_secret       = azuread_application_password.aad_application_password.value

  tags = merge(
    var.tags
  )
  depends_on = [azuread_application.aad_application]
}

module "azure_devops_service_connections" {
  source                      = "./modules/service_connections"
  resource_group_name         = azurerm_resource_group.resource_group.name
  project                     = var.project_name
  environment                 = var.environment
  azure_devops_project_id     = data.azuredevops_project.project.id
  acr_registry_name           = "pythonfastapik8s" # Same as the module python_fastapi_registry.
  service_principal_client_id = azuread_application.aad_application.application_id
  client_secret               = azuread_application_password.aad_application_password.value

  depends_on = [module.python_fastapi_registry, azuread_application.aad_application]
}
