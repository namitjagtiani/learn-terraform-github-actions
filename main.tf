resource "azurerm_resource_group" "wus-rg" {
  name     = "wus-rg"
  location = "West US"
}

resource "random_pet" "sg" {}
