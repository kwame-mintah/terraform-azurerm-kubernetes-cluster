# Kubernetes Cluster Module ---------------------
# -----------------------------------------------

locals {
  common_tags = merge(
    var.tags
  )
}

data "azurerm_client_config" "current" {}

# Create the Azure Kubernetes Cluster
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
    azure_rbac_enabled     = true
    managed                = true
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = [data.azurerm_client_config.current.object_id, "1239ac97-8ed6-4088-9670-14c8e238aed8"] # This is my own Object ID within my tenenat.
  }

  api_server_access_profile {
    # Inbound connections originating from Azure DevOps 
    # https://learn.microsoft.com/en-us/azure/devops/organizations/security/allow-list-ip-url?view=azure-devops&tabs=IP-V4#inbound-connections
    # Azure IP Ranges and Service Tags – Public Cloud
    # https://www.microsoft.com/en-us/download/details.aspx?id=56519
    authorized_ip_ranges = [var.personal_ip_address, "20.166.41.0/24", "40.74.28.0/23"] # Western Europe, North Europe
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
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

# Role assignments for the azure active application
resource "azurerm_role_assignment" "aad_cluster_admin_role" {
  principal_id                     = var.client_object_id
  role_definition_name             = "Azure Kubernetes Service Cluster Admin Role"
  scope                            = azurerm_kubernetes_cluster.cluster.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_cluster_rbac_admin" {
  principal_id                     = var.client_object_id
  role_definition_name             = "Azure Kubernetes Service RBAC Admin"
  scope                            = azurerm_kubernetes_cluster.cluster.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_cluster_rbac_cluster_admin" {
  principal_id                     = var.client_object_id
  role_definition_name             = "Azure Kubernetes Service RBAC Cluster Admin"
  scope                            = azurerm_kubernetes_cluster.cluster.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aad_cluster_contributor" {
  principal_id                     = var.client_object_id
  role_definition_name             = "Azure Kubernetes Service Contributor Role"
  scope                            = azurerm_kubernetes_cluster.cluster.id
  skip_service_principal_aad_check = true
}
