terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDemo"
    storage_account_name = "terraformcodeops"
    container_name       = "tfstatefile"
    access_key           = "anMMpoLzekIyS5XZsI+TmMY71eY1NqRjJOf39GynBk+w5bekWYCLA0DDX+Tye40RhcjQfqDqMWiR+AStZkjLcw=="
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}
