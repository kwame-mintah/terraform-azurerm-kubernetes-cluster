# (1) Uncomment this code block, if you wish to store your state file locally.
# terraform {
#   backend "local" {
#     path = "terraformstate/terraform.tfstate"
#   }
# }

# (2) Only uncomment out this code block, after the tfstate storage account has been  manually created
terraform {
  backend "azurerm" {}
}
