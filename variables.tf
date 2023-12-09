variable "arm_client_id" {
  description = <<-EOF
  The Client ID which should be used. This can also be sourced 
  from the ARM_CLIENT_ID Environment Variable.

EOF

  type = string

}

variable "arm_client_secret" {
  description = <<-EOF
  The Client Secret which should be used. This can also be sourced 
  from the ARM_CLIENT_SECRET Environment Variable.

EOF

  type = string

}

variable "arm_tenant_id" {
  description = <<-EOF
  The Tenant ID which should be used. This can also be sourced 
  from the ARM_TENANT_ID Environment Variable.

EOF

  type = string

}

variable "arm_subscription_id" {
  description = <<-EOF
  The Subscription ID which should be used. This can also be sourced 
  from the ARM_SUBSCRIPTION_ID Environment Variable.

EOF

  type = string

}

variable "cloud_enviornment" {
  description = <<-EOF
  The Cloud Environment which should be used. Possible values are public,
  `usgovernment`, `german`, and `china`. Defaults to `public`. This can also be 
  sourced from the ARM_ENVIRONMENT Environment Variable.

EOF

  type    = string
  default = "public"

}

variable "environment" {
  description = <<-EOF
  The name of the _environment_ to help identify resources.

EOF

  type = string
}

variable "location" {
  description = <<-EOF
  The Azure Region where the Resource Group should exist. 
  Changing this forces a new Resource Group to be created.

EOF

  type    = string
  default = "West Europe"

}

variable "organization_url" {
  description = <<-EOF
    This is the Azure DevOps organization url. 
    It can also be sourced from the AZDO_ORG_SERVICE_URL environment variable.
    
EOF

  type = string
}

variable "tags" {
  description = <<-EOF
    Tags to be added to resources created.
    
EOF

  type    = map(string)
  default = {}
}

variable "personal_ip_address" {
  description = <<-EOF
    Add your client IP address to the networking to allow access.
    
EOF

  type = string
}

variable "project_name" {
  description = <<-EOF
    Name of the project.

EOF

  type = string
}

variable "personal_access_token" {
  description = <<-EOF
    This is the Azure DevOps organization personal access token. 
    The account corresponding to the token will need "owner" privileges for this organization. 
    It can also be sourced from the AZDO_PERSONAL_ACCESS_TOKEN environment variable.

EOF

  type = string
}
