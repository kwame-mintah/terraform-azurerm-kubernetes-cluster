output "tenant_id" {
  description = <<-EOF
    The tenant ID used for this subscription.

EOF

  value = var.arm_tenant_id
}

output "docker_registry_service_connection_id" {
  value       = module.azure_devops_service_connections.docker_registry_service_connection_id
  description = <<-EOF
    The ID of the docker registry service endpoint.

EOF
}

output "azurerm_service_connection_id" {
  value       = module.azure_devops_service_connections.azurerm_service_connection_id
  description = <<-EOF
    The ID of the azure resource manager service endpoint.

EOF
}
