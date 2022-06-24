
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }

  ##################################################################################
  #   To store your Terraform state in azure storge                                #
  #   Configure remote state storage account fisrt                                 #
  #   * terraform init                                                             #
  #   Replace <storage_account_name> with the name of your Azure storage account   #
  ##################################################################################

  /*
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "<storage_account_name>"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
  */

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate30335"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}