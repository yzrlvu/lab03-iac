resource "docker_container" "database" {
  name  = "bd-${terraform.workspace}"
  image = "postgres:16"
  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_DB=postgres"
  ]
  networks_advanced {
    name = docker_network.lab_network.name
  }
}