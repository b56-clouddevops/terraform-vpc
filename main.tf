
module "vpc" {
  source        = "git::https://github.com/b56-clouddevops/tf-module-vpc.git"
  ENV           = var.ENV
  VPC_CIDR      = var.VPC_CIDR
}