terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.0"
      # version = "~> 3.18"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The name of the Azure location"
  default     = "australiaeast"
  type        = string
  validation {
    condition     = contains(["australiaeast", "indonesiacentral"], var.location)
    error_message = "The location must be australiaeast or indonesiacentral."
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}