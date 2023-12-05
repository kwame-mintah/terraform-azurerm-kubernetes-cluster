# Kubernetes Cluster Module ---------------------
# -----------------------------------------------

locals {
  common_tags = merge(
    var.tags
  )
}

data "azurerm_client_config" "current" {}

#tfsec appears to be scanning the wrong arguments as the names
#have been updated / changed e.g. `api_server_access_profile` now contains
#`authorized_ip_ranges` and `api_server_authorized_ip_ranges` is deperacated.
#tfsec:ignore:azure-container-limit-authorized-ips
#tfsec:ignore:azure-container-use-rbac-permissions
#tfsec:ignore:azure-container-logging
resource "azurerm_kubernetes_cluster" "cluster" {
  name                              = "${var.name}-k8s"
  location                          = var.location
  resource_group_name               = var.resource_group_name
  dns_prefix                        = "${var.name}-dns"
  automatic_channel_upgrade         = "stable"
  local_account_disabled            = true
  sku_tier                          = var.sku_tier
  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed                = true
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = [data.azurerm_client_config.current.object_id]
  }

  api_server_access_profile {
    authorized_ip_ranges = [var.personal_ip_address]
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    local.common_tags
  )
  #checkov:skip=CKV_AZURE_4:Out of scope for demostration
  #checkov:skip=CKV_AZURE_7:Out of scope for demostration
  #checkov:skip=CKV2_AZURE_29:Out of scope for demostration
  #checkov:skip=CKV_AZURE_115:Out of scope for demostration
  #checkov:skip=CKV_AZURE_116:Out of scope for demostration
  #checkov:skip=CKV_AZURE_117:Out of scope for demostration
  #checkov:skip=CKV_AZURE_168:Out of scope for demostration
  #checkov:skip=CKV_AZURE_172:Out of scope for demostration
  #checkov:skip=CKV_AZURE_226:Out of scope for demostration
  #checkov:skip=CKV_AZURE_227:Out of scope for demostration
}

resource "azurerm_role_assignment" "kubernetes_role" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.container_registry_id
  skip_service_principal_aad_check = true
}
