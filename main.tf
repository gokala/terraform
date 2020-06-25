provider "azurerm" {
    features{}
}
resource "azurerm_resource_group" "netrg" {
    location=var.location
    name="rgnetwork-${var.enviornment}-rg"    
}
resource "azurerm_virtual_network" "network1" {
    name="mycompany-${var.enviornment}-net"
    location=azurerm_resource_group.netrg.location
    resource_group_name=azurerm_resource_group.netrg.name
    address_space=var.vnet
}
resource "azurerm_subnet" "network1-subnet" {
    name="app-${var.enviornment}-subnet"
    resource_group_name=azurerm_resource_group.netrg.name
    virtual_network_name=azurerm_virtual_network.network1.name
    address_prefix=var.subnet
}
