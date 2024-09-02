//network.tf

# Define the network security group
resource "azurerm_network_security_group" "example" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "ssh"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Define the public IP addresses
resource "azurerm_public_ip" "example_vm1" {
  name                = "${var.public_ip_name}-vm1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "example_vm2" {
  name                = "${var.public_ip_name}-vm2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "example_lb" {
  name                = "${var.public_ip_name}-lb"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

# Associate the NSG with the network interface for VM1
resource "azurerm_network_interface_security_group_association" "example_vm1" {
  network_interface_id      = azurerm_network_interface.example_vm1.id
  network_security_group_id = azurerm_network_security_group.example.id
}

# Associate the NSG with the network interface for VM2
resource "azurerm_network_interface_security_group_association" "example_vm2" {
  network_interface_id      = azurerm_network_interface.example_vm2.id
  network_security_group_id = azurerm_network_security_group.example.id
}
