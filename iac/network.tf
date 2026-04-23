resource "docker_network" "lab_network" {
  name = "red-${terraform.workspace}"
}