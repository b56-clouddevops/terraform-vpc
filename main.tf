module "vpc" {
  # source              = "git::https://github.com/b56-clouddevops/tf-module-vpc.git"
  source                    = "./vendor/modules/vpc"
  
  VPC_CIDR                  = var.VPC_CIDR
  AZ                        = var.AZ
  ENV                       = var.ENV
  PUBLIC_SUBNET_CIDR        = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR       = var.PRIVATE_SUBNET_CIDR
  DEFAULT_VPC_CIDR          = var.DEFAULT_VPC_CIDR
  DEFAULT_VPC_ID            = var.DEFAULT_VPC_ID
  DEFAULT_VPC_RT            = var.DEFAULT_VPC_RT
  PUBLIC_HOSTED_ZONE_ID     = var.PUBLIC_HOSTED_ZONE_ID
  PUBLIC_HOSTED_ZONE_NAME   = var.PUBLIC_HOSTED_ZONE_NAME

  PRIVATE_HOSTED_ZONE_ID    = var.PRIVATE_HOSTED_ZONE_ID
  PRIVATE_HOSTED_ZONE_NAME  = var.PRIVATE_HOSTED_ZONE_NAME
}



# We cannot parametrize anything that's added n the source.
# To limit that, we can use a tool called as Terrafile. All it does is clonnes the remote code from the specified branch and make it locally available.