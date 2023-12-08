output "aad_application_id" {
  value       = azuread_service_principal.service_principal_application_id.id
  description = <<-EOF
    Azure AD application id.

EOF
}

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

