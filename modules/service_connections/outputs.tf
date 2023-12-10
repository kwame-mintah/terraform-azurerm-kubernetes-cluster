output "docker_registry_service_connection_id" {
  value       = azuredevops_serviceendpoint_dockerregistry.docker_registry_service_connection.id
  description = <<-EOF
    The ID of the docker registry service endpoint.

EOF
}

output "azurerm_service_connection_id" {
  value       = azuredevops_serviceendpoint_azurerm.azurerm_service_connection.id
  description = <<-EOF
    The ID of the azure resource manager service endpoint.

EOF
}

