# terraform-aws-module-ben
Networking module during udemy course about terraform

This module manages creation of VPCs and subnets, allowing for the
creation of both public and private subnets.

Usage Example:

```
module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your VPC"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "us-east-1b"
    }
  }
}
```
