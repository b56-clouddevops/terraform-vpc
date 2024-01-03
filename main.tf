module "vpc" {
  # source              = "git::https://github.com/b56-clouddevops/tf-module-vpc.git"
  source              = "./vendor/modules/vpc"
  
  VPC_CIDR            = var.VPC_CIDR
  AZ                  = var.AZ
  ENV                 = var.ENV
  PUBLIC_SUBNET_CIDR  = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR
}