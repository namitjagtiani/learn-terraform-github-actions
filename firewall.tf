resource "azurerm_public_ip" "wus-azfw-pip" {
  name                = "wus-azfw-pip"
  location            = azurerm_resource_group.wus-rg.location
  resource_group_name = azurerm_resource_group.wus-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "wus-azfw" {
  name                = "wus-azfw"
  location            = azurerm_resource_group.wus-rg.location
  resource_group_name = azurerm_resource_group.wus-rg.name
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = (azurerm_virtual_network.wus-vnet.subnet[*])[3].id
    public_ip_address_id = azurerm_public_ip.wus-azfw-pip.id
  }
}

output "azfw-ip" {
  value = (azurerm_firewall.wus-azfw.ip_configuration)
}