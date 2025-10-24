include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "git::https://github.com/JagadeeshJK/iac-with-terraform-aws/tree/main/modules/ec2"
}

inputs = {
  env                = "staging"
  region             = "us-east-1"
  ami                = data.aws_ssm_parameter.latest_ubuntu_ami.value
  instance_type      = "t3.micro"
  instance_count     = 2
  private_subnet_ids = dependency.vpc.outputs.private_subnet_ids
  tags = {
    Environment = "staging"
    Project     = "my-app"
  }
}