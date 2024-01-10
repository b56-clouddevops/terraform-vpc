# Declare the values that are common to all the environments or use this terraform.auto.tfvars to consider these as variables that should bnot be over-ridden
AZ                      = ["us-east-1a", "us-east-1b"]
DEFAULT_VPC_CIDR        = "172.31.0.0/16"
DEFAULT_VPC_ID          = "vpc-0031cc952da0c7bfc"
DEFAULT_VPC_RT          = "rtb-0623fe36206b96d65"

PUBLIC_HOSTED_ZONE_ID   = "Z03169043MR7GRPXZ59K1"
PUBLIC_HOSTED_ZONE_NAME = "b56-roboshop.online"

PRIVATE_HOSTED_ZONE_ID   = "Z031297333JO38PNHPROR"
PRIVATE_HOSTED_ZONE_NAME = "roboshop.internal"

