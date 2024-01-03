module "vpc" {
  source        = "git::https://github.com/b56-clouddevops/tf-module-vpc.git"
  
  env           = var.env
  VPC_CIDR      = var.VPC_CIDR
}