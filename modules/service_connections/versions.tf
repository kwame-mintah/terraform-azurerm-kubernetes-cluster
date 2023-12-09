terraform {
  required_version = "= 1.4.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.82.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "= 0.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.10.0"
    }
  }
}
