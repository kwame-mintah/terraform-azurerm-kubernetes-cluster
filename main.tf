locals {
  common_tags = merge(
    var.tags
  )
}

resource "azurerm_resource_group" "resource_group" {
  name     = "ak8s-${var.environment}-resources"
  location = var.location
  tags = merge(
    local.common_tags
  )
}
