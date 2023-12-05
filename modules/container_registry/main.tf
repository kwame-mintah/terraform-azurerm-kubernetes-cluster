# Container Registry Module ---------------------
# -----------------------------------------------

locals {
  common_tags = merge(
    var.tags
  )
}

resource "azurerm_container_registry" "registry" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku_name
  admin_enabled                 = false
  quarantine_policy_enabled     = true
  public_network_access_enabled = false

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
