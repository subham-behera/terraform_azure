# Azure VM Deployment with Load Balancer

## Overview

This repository contains Terraform scripts to provision two Azure Virtual Machines (VMs) for web hosting. The VMs are connected via an Azure Load Balancer to distribute incoming traffic efficiently.

## Prerequisites

- Terraform installed (version 1.0 or higher)
- Azure CLI installed and configured
- An Azure account

## Configuration

1. Clone the repository:
   ```bash
   git clone https://github.com/subham-behera/terraform_azure.git
   cd terraform_azure
   ```

2. Set up your Terraform variables:
   - Create a file named `terraform.tfvars` in the root directory.
   - Define your Azure credentials and any specific configurations.

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan your deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Components

- **VMs**: Two Azure VMs configured for web hosting.
- **Load Balancer**: Distributes traffic between the VMs.

## Cleanup

To remove the resources created by Terraform, run:
```bash
terraform destroy
```
