# modules/databricks/variables.tf

variable "databricks_token" {
  description = "Token for authenticating with the Databricks instance."
  type        = string
}

variable "workspace_name" {
  description = "Name of the Databricks workspace."
  type        = string
}

variable "location" {
  description = "Azure region where the Databricks workspace and resources will be deployed."
  type        = string
}
