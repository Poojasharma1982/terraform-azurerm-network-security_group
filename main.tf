resource "azurerm_network_security_group" "mynsg1" {
  name                = var.networksecuritygroup-name
  location            = var.networksecuritygroup-location
   resource_group_name = var.rg-nsg-name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet_network_security_group_association" "mynsg1association" {
  subnet_id                 = var.subnet-id
  network_security_group_id = azurerm_network_security_group.mynsg1.id
}
