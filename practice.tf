terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.70"
        }
    }
}
provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "my_rg" {
    name = "palrg2"
    location = "central india"
}

resource "azurerm_storage_account" "my_sta" {
    name = "mysto2"
    resource_group_name = azurerm_resource_group.my_rg.name
    location = azurerm_resource_group.my_rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mycont" {
    name = "cont2"
    storage_account_name = azurerm_storage_account.my_sta.name
    container_access_type = "private"
}

