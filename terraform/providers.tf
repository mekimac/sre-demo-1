terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.54.0"
    }
  }

  # store state in a local file in this folder
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  
  subscription_id = "ad7e7cbf-50b8-4d48-92f7-520e74cda88a"
  tenant_id       = "7c46536a-ad03-4afb-b062-e98f7d3d75e6"
}
