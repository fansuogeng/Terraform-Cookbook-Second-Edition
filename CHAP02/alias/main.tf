terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.9.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "564f76e4-e3e3-4b17-b87b-7f8eff29de8c"
  features {}
}


resource "azurerm_resource_group" "rg1" {
  name     = "rg-sub1"
  location = "australiaeast"
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-sub2"
  location = "australiaeast"
}