output "public_ip_vm1" {
  value = azurerm_public_ip.example_vm1.ip_address
  description = "The public IP address of VM1"
}

output "public_ip_vm2" {
  value = azurerm_public_ip.example_vm2.ip_address
  description = "The public IP address of VM2"
}

output "public_ip_load_balancer" {
  value = azurerm_public_ip.example_lb.ip_address
  description = "The public IP address of the Load Balancer"
}

output "vm1_id" {
  value = azurerm_linux_virtual_machine.example_vm1.id
  description = "The ID of VM1"
}

output "vm2_id" {
  value = azurerm_linux_virtual_machine.example_vm2.id
  description = "The ID of VM2"
}

output "load_balancer_id" {
  value = azurerm_lb.example.id
  description = "The ID of the Load Balancer"
}

output "availability_set_id" {
  value = azurerm_availability_set.example.id
  description = "The ID of the Availability Set"
}
