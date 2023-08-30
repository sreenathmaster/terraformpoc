# modules/snowflake/main.tf

provider "snowflake" {
  username = var.snowflake_username
  password = var.snowflake_password
  account  = var.snowflake_account
}

resource "snowflake_database" "example_database" {
  name = "example_db"
}

resource "snowflake_warehouse" "example_warehouse" {
  name      = "example_warehouse"
  warehouse = "STANDARD"
  size      = "X-SMALL"
  auto_suspend = 300
}

resource "snowflake_role" "example_role" {
  name = "example_role"
}

resource "snowflake_user" "example_user" {
  name     = "example_user"
  login_name = "user@example.com"
  password = "P@ssw0rd"
}

resource "snowflake_grant" "example_grant" {
  privilege = "USAGE"
  on        = "WAREHOUSE"
  to        = snowflake_role.example_role.name
  roles     = [snowflake_role.example_role.name]
}

resource "snowflake_warehouse_grant" "example_warehouse_grant" {
  privilege = "USAGE"
  warehouse = snowflake_warehouse.example_warehouse.name
  roles     = [snowflake_role.example_role.name]
}

resource "snowflake_scim_connector" "example_scim_connector" {
  name     = "example_scim_connector"
  enabled  = true
  url      = "https://example.com/scim"
  username = "scim_username"
  password = "scim_password"
}

resource "snowflake_database" "example_db" {
  name = "example_db"
}

resource "snowflake_role" "example_role" {
  name = "example_role"
}

resource "snowflake_user" "example_user" {
  name       = "example_user"
  login_name = "user@example.com"
}

resource "snowflake_service_integration" "example_service_integration" {
  name          = "example_service_integration"
  type          = "OAUTH"
  enabled       = true
  client_key    = "client_key"
  client_secret = "client_secret"
}

resource "snowflake_entitlement" "example_entitlement" {
  role_name = snowflake_role.example_role.name
  user_name = snowflake_user.example_user.name
}

resource "snowflake_ad_group" "ad_groups" {
  name = ["group1", "group2", "group3", "group4"]
}

resource "snowflake_scim_integration" "example_scim_integration" {
  name             = "example_scim_integration"
  external_id      = snowflake_scim_connector.example_scim_connector.id
  ad_group_names   = snowflake_ad_group.ad_groups.*.name
  default_role_name = snowflake_role.example_role.name
}
