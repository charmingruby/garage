data "aws_caller_identity" "current" {}

data "terraform_remote_state" "this" {
  backend = "s3"

  config = {
    bucket = format("tfstate-%s", data.aws_caller_identity.current.account_id)
    key    = format("garage/%s/terraform.tfstate", var.environment)
    region = var.aws_region
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
