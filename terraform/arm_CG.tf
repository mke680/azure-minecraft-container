# Azure Container Group
resource "azurerm_container_group" "minecraft_container" {
  name                = "craftlabs_papermc"
  location            = azurerm_resource_group.minecraft_container.location
  resource_group_name = azurerm_resource_group.minecraft_container.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  # Container One
  container {
    name   = "hello-world"
    image  = "${docker_image}"
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
