//variables.tf
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "network_security_group_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "network_interface_name" {
  type = string
}

variable "virtual_machine_name" {
  type = string
}

variable "admin_username" {
  type = string
}

# Variables for SSH key paths
variable "admin_ssh_key_path_vm1" {
  type = string
}

variable "admin_ssh_key_path_vm2" {
  type = string
}

variable "availability_set_name" {
  type = string
}

variable "load_balancer_name" {
  type = string
}
