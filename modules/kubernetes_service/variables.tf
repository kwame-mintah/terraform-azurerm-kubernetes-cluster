variable "client_id" {
  description = <<-EOF

EOF

  type = string
}

variable "client_secret" {
  description = <<-EOF

EOF

  type = string
}

variable "location" {
  description = <<-EOF
  The supported Azure location where the resource exists. 
  Changing this forces a new resource to be created.

EOF

  type = string
}

variable "name" {
  description = <<-EOF
  Specifies the name of the Container Registry. 
  Only Alphanumeric characters allowed. Changing this forces a new 
  resource to be created.

EOF

  type = string
}

variable "resource_group_name" {
  description = <<-EOF
  The name of the resource group in which to create the Web App Bot. 
  Changing this forces a new resource to be created.

EOF

  type = string
}

variable "sku_tier" {
  description = <<-EOF
  The SKU Tier that should be used for this Kubernetes Cluster. Possible 
  values are `Free`, and Standard (which includes the Uptime SLA).

EOF

  type    = string
  default = "Standard"
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