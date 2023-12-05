# Terraform Azurem Template

The main purpose of this repository is to create a template for [Terraform](https://www.terraform.io/). This project will focus on the [Azurem](https://registry.terraform.io/providers/hashicorp/azurerm/3.58.0) provider.

## Development

### Dependencies

- [terraform](https://www.terraform.io/)
- [terragrunt](https://terragrunt.gruntwork.io/)
- [pre-commit](https://pre-commit.com/)
- [terraform-docs](https://terraform-docs.io/) this is required for `terraform_docs` hooks

## Prerequisites

1. Have a [Azure Portal](https://portal.azure.com/) account. 
2. You will need to create a Service Principal with a Client Secret [follow instructions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-in-the-azure-portal).

## Usage

1. Navigate to the environment you would like to deploy,
2. Plan your changes with `terragrunt plan` to see what changes will be made,
3. If you're happy with the changes `terragrunt apply`.

Please note that `.tfstate` files are stored locally on your machine as no backend has been specified. If you would like to properly version control your state files, it is possible to use an S3 bucket to store these files. 
This will ensure anyone else other than you running a plan/apply will always be using the same state file.

## Pre-Commit hooks

Git hook scripts are very helpful for identifying simple issues before pushing any changes. Hooks will run on every commit automatically pointing out issues in the code e.g. trailing whitespace.

To help with the maintenance of these hooks, [pre-commit](https://pre-commit.com/) is used, along with [pre-commit-hooks](https://pre-commit.com/#install).

Please following [these instructions](https://pre-commit.com/#install) to install `pre-commit` locally and ensure that you have run `pre-commit install` to install the hooks for this project.

Additionally, once installed, the hooks can be updated to the latest available version with `pre-commit autoupdate`.

## Documentation Generation

Code formatting and documentation for `variables` and `outputs` is generated using [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform/releases) hooks that in turn uses [terraform-docs](https://github.com/terraform-docs/terraform-docs) that will insert/update documentation. The following markers have been added to the `README.md`:
```
<!-- {BEGINNING|END} OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
```

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_python_fastapi_registry"></a> [python\_fastapi\_registry](#module\_python\_fastapi\_registry) | ./modules/container_registry | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.82.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arm_client_id"></a> [arm\_client\_id](#input\_arm\_client\_id) | The Client ID which should be used. This can also be sourced <br>from the ARM\_CLIENT\_ID Environment Variable. | `string` | n/a | yes |
| <a name="input_arm_client_secret"></a> [arm\_client\_secret](#input\_arm\_client\_secret) | The Client Secret which should be used. This can also be sourced <br>from the ARM\_CLIENT\_SECRET Environment Variable. | `string` | n/a | yes |
| <a name="input_arm_subscription_id"></a> [arm\_subscription\_id](#input\_arm\_subscription\_id) | The Subscription ID which should be used. This can also be sourced <br>from the ARM\_SUBSCRIPTION\_ID Environment Variable. | `string` | n/a | yes |
| <a name="input_arm_tenant_id"></a> [arm\_tenant\_id](#input\_arm\_tenant\_id) | The Tenant ID which should be used. This can also be sourced <br>from the ARM\_TENANT\_ID Environment Variable. | `string` | n/a | yes |
| <a name="input_cloud_enviornment"></a> [cloud\_enviornment](#input\_cloud\_enviornment) | The Cloud Environment which should be used. Possible values are public,<br>`usgovernment`, `german`, and `china`. Defaults to `public`. This can also be <br>sourced from the ARM\_ENVIRONMENT Environment Variable. | `string` | `"public"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the _environment_ to help identify resources. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Resource Group should exist. <br>Changing this forces a new Resource Group to be created. | `string` | `"West Europe"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The tenant ID used for this subscription. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
