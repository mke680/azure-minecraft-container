# Configure the Docker provider
provider "docker" {
  host = "ssh://user@remote-host:22"
}

# Azure Container Group
resource "azurerm_container_group" "minecraft_container" {
  name                = "craftlabs_papermc"
  location            = azurerm_resource_group.minecraft_container.location
  resource_group_name = azurerm_resource_group.minecraft_container.name
  ip_address_type     = "public"
  dns_name_label      = "craftlabs"
  os_type             = "Linux"

  # Container One
  container {
    name   = "craftlabs01"
    image  = var.docker_image
    cpu    = "1"
    memory = "2"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  # Tags
  tags = {
    environment = "testing"
  }
}
