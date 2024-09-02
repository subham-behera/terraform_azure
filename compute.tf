//compute.tf
# Define the availability set
resource "azurerm_availability_set" "example" {
  name                = var.availability_set_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  managed             = true
}

# Define the network interfaces for VMs
resource "azurerm_network_interface" "example_vm1" {
  name                = "${var.network_interface_name}-vm1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example_vm1.id
  }
}

resource "azurerm_network_interface" "example_vm2" {
  name                = "${var.network_interface_name}-vm2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example_vm2.id
  }
}

# Define the virtual machines with different SSH keys
resource "azurerm_linux_virtual_machine" "example_vm1" {
  name                = "${var.virtual_machine_name}-vm1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_DS1_v2"
  availability_set_id = azurerm_availability_set.example.id
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.example_vm1.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_key_path_vm1)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "example_vm2" {
  name                = "${var.virtual_machine_name}-vm2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_DS1_v2"
  availability_set_id = azurerm_availability_set.example.id
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.example_vm2.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_key_path_vm2)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
