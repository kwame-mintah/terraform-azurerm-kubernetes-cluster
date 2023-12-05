# Terragrunt will copy the Terraform files from the locations specified into this directory
terraform {
  source = "../.."
}

locals {
  environment  = "development"
  project_name = "k-infrastructure"
}

# These are inputs that need to be passed for the terragrunt configuration
inputs = {
  environment = "development"
  tags = {
    Terraform   = "true"
    Environment = "${local.environment}"
    Project     = "${local.project_name}"
  }
}

# If you do not want to create manually create a storage account and store state files
# locally, uncomment the code block below.
// remote_state {
//   backend = "local"
//   config = {
//     path = "${get_parent_terragrunt_dir()}/${path_relative_to_include()}/${local.project_name}-terraform.tfstate"
//   }
// }

# If moving from local storage to remote `azurerm` use `terragrunt init -migrate-state`
# This should copy your local state file to your storage account.
remote_state {
  backend = "azurerm"
  config = {
    key                  = "${local.environment}/${path_relative_to_include()}/${local.project_name}-terraform.tfstate"
    resource_group_name  = "ad-hoc-azuredevops"
    storage_account_name = "tfstateazuredevop"
    container_name       = "tfstate-${local.project_name}"
  }
}
