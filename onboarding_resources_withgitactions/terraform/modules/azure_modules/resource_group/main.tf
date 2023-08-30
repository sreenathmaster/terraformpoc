resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "subnet" {
  source              = "../../modules/subnet"
  name                = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = var.subnet_address_prefixes
}
