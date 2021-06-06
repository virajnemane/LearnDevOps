module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"
  # insert the 18 required variables here

  name = "my-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["us-west-1a", "us-west-1b", "us-west-1c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
  
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
