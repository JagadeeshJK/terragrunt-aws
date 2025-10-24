include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/JagadeeshJK/iac-with-terraform-aws.git//modules/vpc"
}

inputs = {
  env            = "staging"
  region         = "us-east-1"
  vpc_cidr       = "10.1.0.0/16"
  public_subnets = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnets = ["10.1.2.0/24", "10.1.3.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
}
