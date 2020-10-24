# Azure Region
variable "location" {}

# Docker Image
variable "docker_image" {}

# VM Credentials
variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

# Prefix for resouce naming
variable "prefix" {
  type = string
  #default = "my"
}

variable "loc_prefix" {
  type = string
  #default = "my"
}

variable "int_prefix" {
  type    = string
  default = "01"
}

# Azure Resource Tags
variable "tags" {
  #type = "map" # Maps are collection of string values

  default = {
    Environment = "Terraform DI"
    Dept        = "Data Integrity"
  }
}

# VM SKU uBuntu Versions
variable "sku" {
  default = {
    westus = "16.04-LTS"
    eastus = "18.04-LTS"
  }
}
