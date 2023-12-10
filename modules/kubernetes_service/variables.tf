variable "client_object_id" {
  description = <<-EOF
  The Client (Object) ID for the Service Principal.
EOF

  type = string
}

variable "client_id" {
  description = <<-EOF
  The Client (Application) ID for the Service Principal.
EOF

  type = string
}

variable "client_secret" {
  description = <<-EOF
  The Client Secret for the Service Principal.
EOF

  type = string
}

variable "location" {
  description = <<-EOF
  The location where the Managed Kubernetes Cluster should be created.
  Changing this forces a new resource to be created.

EOF

  type = string
}

variable "name" {
  description = <<-EOF
  The name of the Managed Kubernetes Cluster to create. 
  Changing this forces a new resource to be created.

EOF

  type = string
}

variable "resource_group_name" {
  description = <<-EOF
  Specifies the Resource Group where the Managed Kubernetes Cluster should exist. 
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
