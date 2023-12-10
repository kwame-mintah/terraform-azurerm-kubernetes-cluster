variable "service_principal_id" {
  description = <<-EOF
  The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. 
  Changing this forces a new resource to be created.
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

variable "georeplication_location" {
  description = <<-EOF
  A location where the container registry should be geo-replicated.
  Cannot contain the location where the Container Registry exists.

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
  The name of the resource group in which to create the Container Registry.
  Changing this forces a new resource to be created.

EOF

  type = string
}

variable "sku_name" {
  description = <<-EOF
  The SKU name of the container registry. Possible values are `Basic`, `Standard`
  and `Premium`.

EOF

  type    = string
  default = "Premium"
}

variable "tags" {
  description = <<-EOF
    Tags to be added to resources created.
    
EOF

  type    = map(string)
  default = {}
}
