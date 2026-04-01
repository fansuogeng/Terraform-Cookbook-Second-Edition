terraform {
  required_version = ">= 0.13,<=2"
  required_providers {
    azurerm = {
      version = "~>3.0" # not available on darwin/arm64
    }
  }
}

provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  default = "rg_test"
  type    = string
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "australiaeast"
}

resource "azurerm_public_ip" "pip" {
  name                         = "book-ip"
  location                     = "australiaeast"
  resource_group_name          = azurerm_resource_group.rg.name
  allocation_method            = "Static"
  sku                          = "Standard"
  domain_name_label            = "bookdevops"
}
