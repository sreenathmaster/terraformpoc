# modules/snowflake/variables.tf

variable "snowflake_username" {
  description = "Snowflake username for authentication."
  type        = string
}

variable "snowflake_password" {
  description = "Snowflake password for authentication."
  type        = string
}

variable "snowflake_account" {
  description = "Snowflake account name."
  type        = string
}
