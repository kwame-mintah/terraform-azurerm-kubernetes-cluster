<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.4.5 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.46.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | = 0.8.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.82.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.46.0 |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.8.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.82.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.aad_application](https://registry.terraform.io/providers/hashicorp/azuread/2.46.0/docs/resources/application) | resource |
| [azuread_service_principal.service_principal_application_id](https://registry.terraform.io/providers/hashicorp/azuread/2.46.0/docs/resources/service_principal) | resource |
| [azuredevops_serviceendpoint_azurerm.azurem_service_connection](https://registry.terraform.io/providers/microsoft/azuredevops/0.8.0/docs/resources/serviceendpoint_azurerm) | resource |
| [azuredevops_serviceendpoint_dockerregistry.docker_registry_service_connection](https://registry.terraform.io/providers/microsoft/azuredevops/0.8.0/docs/resources/serviceendpoint_dockerregistry) | resource |
| [azurerm_container_registry_scope_map.registry_scope_map](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/container_registry_scope_map) | resource |
| [azurerm_container_registry_token.registry_token](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/container_registry_token) | resource |
| [azurerm_container_registry_token_password.token_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/container_registry_token_password) | resource |
| [azurerm_role_assignment.aad_acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aad_acr_push](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aad_acr_quarantine_reader](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/role_assignment) | resource |
| [random_uuid.uuid](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/uuid) | resource |
| [time_rotating.token_password_expiry](https://registry.terraform.io/providers/hashicorp/time/0.10.0/docs/resources/rotating) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/2.46.0/docs/data-sources/client_config) | data source |
| [azurerm_container_registry.registry](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/data-sources/container_registry) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_registry_name"></a> [acr\_registry\_name](#input\_acr\_registry\_name) | The URL that can be used to log into the container registry. | `string` | n/a | yes |
| <a name="input_app_owners"></a> [app\_owners](#input\_app\_owners) | Add additional owners to the application registration,<br>by defualt the caller is added. | `string` | `""` | no |
| <a name="input_azure_devops_project_id"></a> [azure\_devops\_project\_id](#input\_azure\_devops\_project\_id) | The project id within Azure DevOps. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the _environment_ to help identify resources. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the Azure DevOps project the resource belongs to. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Name of the Resource Group where the resource already exists. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aad_application_id"></a> [aad\_application\_id](#output\_aad\_application\_id) | Azure AD application id. |
| <a name="output_container_registry_password1_token_value"></a> [container\_registry\_password1\_token\_value](#output\_container\_registry\_password1\_token\_value) | The name of the Container Registry. |
| <a name="output_container_registry_token_name"></a> [container\_registry\_token\_name](#output\_container\_registry\_token\_name) | The name of the Container Registry token. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
