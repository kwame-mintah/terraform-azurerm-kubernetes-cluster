variable "azure_devops_project_id" {
  description = <<-EOF
    The project id within Azure DevOps.
    
EOF

  type = string
}

variable "acr_registry_name" {
  description = <<-EOF
    The name of the Azure Container Registry.
    
EOF

  type = string
}

variable "environment" {
  description = <<-EOF
  The name of the _environment_ to help identify resources.

EOF

  type = string
}

variable "project" {
  description = <<-EOF
  The name of the Azure DevOps project the resource belongs to.

EOF

  type = string
}

variable "client_secret" {
  description = <<-EOF
  The service principal secret.
EOF

  type = string
}

variable "service_principal_client_id" {
  description = <<-EOF
  The service principal application Id
EOF

  type = string
}

variable "resource_group_name" {
  description = <<-EOF
  The name of the Resource Group where the resource already exists.

EOF

  type = string
}
