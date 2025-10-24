locals {
  region = "us-east-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "tf-state-aws-remote"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
