# Kubernetes Cluster Module

This module will create a Azure Kubernetes Cluster, and assign the azure active directory application registration roles to deploy and manage the cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.4.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.82.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.82.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_role_assignment.aad_cluster_admin_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aad_cluster_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aad_cluster_rbac_admin](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aad_cluster_rbac_cluster_admin](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Client (Application) ID for the Service Principal. | `string` | n/a | yes |
| <a name="input_client_object_id"></a> [client\_object\_id](#input\_client\_object\_id) | The Client (Object) ID for the Service Principal. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Client Secret for the Service Principal. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location where the Managed Kubernetes Cluster should be created.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Managed Kubernetes Cluster to create. <br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_personal_ip_address"></a> [personal\_ip\_address](#input\_personal\_ip\_address) | Add your client IP address to the networking to allow access. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Resource Group where the Managed Kubernetes Cluster should exist. <br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible <br>values are `Free`, and Standard (which includes the Uptime SLA). | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to resources created. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
