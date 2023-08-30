provider "databricks" {
  host = "https://<databricks-instance>.cloud.databricks.com"
  token = "<your-databricks-token>"
}


resource "databricks_workspace" "example_workspace" {
  name    = "example-workspace"
  location = "East US 2"
  managed_resource_group_id = "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>"
}

resource "databricks_group" "example_group" {
  display_name = "example-group"
  members = ["user1@example.com", "user2@example.com"]
}

resource "databricks_cluster" "example_cluster" {
  name                       = "example-cluster"
  spark_version              = "7.3.x-scala2.12"
  node_type_id               = "Standard_DS3_v2"
  num_workers                = 2
  spark_conf {
    "spark.databricks.cluster.profile" = "serverless"
  }
}
