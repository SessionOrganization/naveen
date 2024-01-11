locals {
  tenant_id               = "123456788" # Tenant id
  current_subscription_id = "123456785" # Subscription ID
}

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.63.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-keyvault"
    storage_account_name = "stgkeyvault"
    container_name       = "tf-state-files"
    key                  = "keyvault.tfstate"
  }
}

provider "azurerm" {
  features {}

  tenant_id       = local.tenant_id
  subscription_id = local.current_subscription_id
}
