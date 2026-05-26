
# Terraform Azure Storage Infrastructure

This Terraform project creates the following resources in Microsoft Azure:

- Resource Group
- Storage Account
- Storage Container

---

# Architecture

Azure Resources Created:

1. Resource Group
2. Storage Account
3. Private Storage Container

---

# Prerequisites

Before running this project, ensure you have:

- Terraform installed
- Azure CLI installed
- Azure Subscription
- Visual Studio Code (Optional)

---

# Provider Configuration

This project uses:

- AzureRM Provider Version: 4.70

---

# Project Structure

```bash
.
├── main.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── README.md
```

---

# Terraform Code Explanation

## Resource Group

Creates a Resource Group in Central India region.

```hcl
resource "azurerm_resource_group" "my_rg" {
    name     = "palrg2"
    location = "central india"
}
```

---

## Storage Account

Creates a Standard LRS Storage Account.

```hcl
resource "azurerm_storage_account" "my_sta" {
    name                     = "mysto2"
    resource_group_name      = azurerm_resource_group.my_rg.name
    location                 = azurerm_resource_group.my_rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
```

---

## Storage Container

Creates a private Blob Storage Container.

```hcl
resource "azurerm_storage_container" "mycont" {
    name                  = "cont2"
    storage_account_name  = azurerm_storage_account.my_sta.name
    container_access_type = "private"
}
```

---

# How to Deploy

## Step 1: Login to Azure

```bash
az login
```

---

## Step 2: Initialize Terraform

```bash
terraform init
```

---

## Step 3: Validate Configuration

```bash
terraform validate
```

---

## Step 4: Preview Infrastructure

```bash
terraform plan
```

---

## Step 5: Deploy Resources

```bash
terraform apply
```

Type:

```bash
yes
```

when prompted.

---

# Verify Resources

After deployment, verify resources in:

- Azure Portal
- Resource Group: `palrg2`

---

# Destroy Infrastructure

To remove all resources:

```bash
terraform destroy
```

---

# Important Notes

- Storage Account name must be globally unique.
- Storage Container access level is set to `private`.
- Region used: `Central India`.

---

# Technologies Used

- Terraform
- Microsoft Azure
- AzureRM Provider

---

# Author

Vaibhav DevOps

---
