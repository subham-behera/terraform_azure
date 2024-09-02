//load_balancer.tf
# Define the load balancer
resource "azurerm_lb" "example" {
  name                = var.load_balancer_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = azurerm_public_ip.example_lb.id
  }
}

# Define the backend address pool
resource "azurerm_lb_backend_address_pool" "example" {
  name                = "backendpool"
  loadbalancer_id     = azurerm_lb.example.id
}

# Define the health probe
resource "azurerm_lb_probe" "example" {
  name                = "healthprobe"
  loadbalancer_id     = azurerm_lb.example.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 15
  number_of_probes    = 2
}

# Define the load balancing rule
resource "azurerm_lb_rule" "example" {
  name                             = "http_rule"
  loadbalancer_id                  = azurerm_lb.example.id
  frontend_ip_configuration_name   = "frontend"
  backend_address_pool_ids          = [azurerm_lb_backend_address_pool.example.id]
  probe_id                         = azurerm_lb_probe.example.id
  protocol                         = "Tcp"
  frontend_port                    = 80
  backend_port                     = 80
  idle_timeout_in_minutes          = 4
  enable_floating_ip               = false
  enable_tcp_reset                 = true
  load_distribution                = "Default"
}


# Associate the network interfaces with the backend pool
resource "azurerm_network_interface_backend_address_pool_association" "example_vm1" {
  network_interface_id    = azurerm_network_interface.example_vm1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}

resource "azurerm_network_interface_backend_address_pool_association" "example_vm2" {
  network_interface_id    = azurerm_network_interface.example_vm2.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}

