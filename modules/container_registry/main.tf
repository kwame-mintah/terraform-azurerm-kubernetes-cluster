# Container Registry Module ---------------------
# -----------------------------------------------

locals {
  common_tags = merge(
    var.tags
  )
}

resource "azurerm_container_registry" "registry" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku_name
  admin_enabled       = false
  #checkov:skip=CKV_AZURE_166:Azure Pipelines not configured to remove images from quarantine at the moment.
  quarantine_policy_enabled = false # this is a preview feature at the moment.
  #checkov:skip=CKV_AZURE_139:Previously configured to reflect selected networks allowed, however need to know load balancer ip addresses.
  public_network_access_enabled = true
  network_rule_set {
    default_action = "Allow"
    # FIXME: Default should not be allow, but deny. This change requires knowing the load balancers
    # IP Address(s) so they can pull the image from the azure registry.
    # https://learn.microsoft.com/en-us/troubleshoot/azure/azure-kubernetes/cannot-pull-image-from-acr-to-aks-cluster#solution-2-add-aks-load-balancers-public-ip-address-to-allowed-ip-address-range-of-the-container-registry
    # 
  }

  retention_policy {
    enabled = true
    days    = 7
  }
  trust_policy {
    enabled = true
  }
  georeplications {
    location                = var.georeplication_location
    zone_redundancy_enabled = true

    tags = merge(
      local.common_tags
    )
  }

  tags = merge(
    local.common_tags
  )
}

# Role assignments to registry
resource "azurerm_role_assignment" "aad_acr_quarantine_reader" {
  principal_id                     = var.service_principal_id
  role_definition_name             = "AcrQuarantineReader"
  scope                            = azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_acr_push" {
  principal_id                     = var.service_principal_id
  role_definition_name             = "AcrPush"
  scope                            = azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_acr_pull" {
  principal_id                     = var.service_principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}
