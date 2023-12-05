output "container_registry_id" {
  value       = azurerm_container_registry.registry.id
  description = <<-EOF
    The ID of the Container Registry.

EOF
}

output "container_registry_name" {
  value       = azurerm_container_registry.registry.name
  description = <<-EOF
    The name of the Container Registry.

EOF
}
