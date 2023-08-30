# modules/databricks/main.tf
provider "azurerm" {
  features {}
}

provider "databricks" {
  hostname = "https://<databricks-instance>.azuredatabricks.net"
  token = var.databricks_token
}

resource "databricks_workspace" "workspace" {
  name = var.workspace_name
  location = var.location
}
