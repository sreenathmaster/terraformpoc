# modules/databricks/main.tf
provider "azurerm" {
  features {}
}

provider "databricks" {
  hostname = "https://<databricks-instance>.azuredatabricks.net"
  token    = var.databricks_token
}

resource "databricks_workspace" "workspace" {
  name     = var.workspace_name
  location = var.location
}

resource "databricks_cluster" "example_cluster" {
  name                   = "example-cluster"
  spark_version          = "7.3.x-scala2.12"
  node_type_id           = "Standard_DS3_v2"
  num_workers            = 2
  cluster_log_conf {
    dbfs {
      destination = "dbfs:/databricks_logs"
    }
  }
}

resource "databricks_cluster_policy" "example_cluster_policy" {
  name                   = "example-cluster-policy"
  cluster_id             = databricks_cluster.example_cluster.id
  definition {
    spark_version {
      exact = "7.3.x-scala2.12"
    }
  }
}

resource "databricks_catalog" "example_catalog" {
  name = "example-catalog"
  cluster_id = databricks_cluster.example_cluster.id
}

resource "databricks_entitlement" "example_entitlement" {
  name        = "example-entitlement"
  workspace_id = databricks_workspace.workspace.id
  principal {
    group {
      display_name = "Example Group"
      members = ["user1@example.com", "user2@example.com"]
    }
  }
  privilege {
    cluster_id = databricks_cluster.example_cluster.id
    permission = "CAN_RUN"
  }
}

resource "databricks_metastore" "example_metastore" {
  name        = "example-metastore"
  workspace_id = databricks_workspace.workspace.id
}

resource "databricks_metastore_assignment" "example_metastore_assignment" {
  metastore_id = databricks_metastore.example_metastore.id
  database_name = "example_db"
}
