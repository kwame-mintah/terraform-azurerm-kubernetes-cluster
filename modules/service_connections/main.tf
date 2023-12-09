# Service Connections Module --------------------
# -----------------------------------------------

# https://dev.azure.com/{ORGANISATION}/{PROJECTNAME}/_apis/serviceendpoint/endpoints?api-version=6.0-preview.4
resource "random_uuid" "uuid" {
  count = 2
}

data "azurerm_container_registry" "registry" {
  name                = var.acr_registry_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subscription" "current" {}

resource "azuredevops_serviceendpoint_azurerm" "azurerm_service_connection" {
  project_id                             = var.azure_devops_project_id
  service_endpoint_name                  = "${data.azurerm_subscription.current.display_name} Azure Resource Manager (ServicePrincipal) (${var.project}-${var.environment})"
  description                            = "Managed by Terraform for project: ${var.project}"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }
  azurerm_spn_tenantid      = data.azurerm_subscription.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}

# Role assignments to registry
resource "azurerm_role_assignment" "aad_acr_quarantine_reader" {
  principal_id                     = var.client_id
  role_definition_name             = "AcrQuarantineReader"
  scope                            = data.azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_acr_push" {
  principal_id                     = var.client_id
  role_definition_name             = "AcrPush"
  scope                            = data.azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_acr_pull" {
  principal_id                     = var.client_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}

# Token generation
resource "azurerm_container_registry_scope_map" "registry_scope_map" {
  name                    = "read-and-write-to-${var.acr_registry_name}"
  container_registry_name = var.acr_registry_name
  resource_group_name     = var.resource_group_name
  actions = [
    "repositories/${var.acr_registry_name}/content/read",
    "repositories/${var.acr_registry_name}/content/write"
  ]
}

resource "azurerm_container_registry_token" "registry_token" {
  name                    = "${var.acr_registry_name}-registry-password-token"
  container_registry_name = var.acr_registry_name
  resource_group_name     = var.resource_group_name
  scope_map_id            = azurerm_container_registry_scope_map.registry_scope_map.id
}

resource "azurerm_container_registry_token_password" "token_password" {
  container_registry_token_id = azurerm_container_registry_token.registry_token.id

  password1 {
    expiry = time_rotating.token_password_expiry.rotation_rfc3339
  }
}

resource "time_rotating" "token_password_expiry" {
  rotation_days = 90
}

# Create Docker Registry service connection
resource "azuredevops_serviceendpoint_dockerregistry" "docker_registry_service_connection" {
  project_id            = var.azure_devops_project_id
  service_endpoint_name = "${data.azurerm_subscription.current.display_name} Docker Registry (Other) (${var.project}-${var.environment})"
  docker_registry       = "https://${var.acr_registry_name}.azurecr.io/v1/"
  docker_username       = azurerm_container_registry_token.registry_token.name
  docker_password       = azurerm_container_registry_token_password.token_password.password1[0].value
  registry_type         = "Others"
  description           = "Managed by Terraform for project: ${var.project}"
}
