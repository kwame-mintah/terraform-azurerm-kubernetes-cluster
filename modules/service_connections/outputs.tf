output "container_registry_token_name" {
  value       = azurerm_container_registry_token.registry_token.name
  description = <<-EOF
    The name of the Container Registry token.

EOF
  sensitive   = true
}

output "container_registry_password1_token_value" {
  value       = azurerm_container_registry_token_password.token_password.password1[0].value
  description = <<-EOF
    The name of the Container Registry.

EOF
  sensitive   = true
}

