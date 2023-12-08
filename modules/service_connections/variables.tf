variable "azure_devops_project_id" {
  description = <<-EOF
    The project id within Azure DevOps.
    
EOF

  type = string
}

variable "app_owners" {
  description = <<-EOF
    Add additional owners to the application registration,
    by defualt the caller is added.
    
EOF

  type    = string
  default = ""
}

variable "acr_registry_name" {
  description = <<-EOF
    The URL that can be used to log into the container registry.
    
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

variable "resource_group_name" {
  description = <<-EOF
  The Name of the Resource Group where the resource already exists.

EOF

  type = string
}
