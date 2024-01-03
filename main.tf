module "vpc" {
  source        = "git::https://github.com/b56-clouddevops/tf-module-vpc.git"
  
  VPC_CIDR      = var.VPC_CIDR
  ENV           = var.ENV
}