module "resource_group" {
  source                       = "../../modules/resource_group"
  name                         = var.resource_group_name
  location                     = var.resource_group_location
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name                  = var.subnet_name
  subnet_address_prefixes      = var.subnet_address_prefixes
}
