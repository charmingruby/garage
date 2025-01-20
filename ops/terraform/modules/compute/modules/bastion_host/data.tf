data "aws_caller_identity" "current" {}

data "terraform_remote_state" "this" {
  backend = "s3"

  config = {
    bucket = format("tfstate-%s", data.aws_caller_identity.current.account_id)
    key    = format("garage/%s/terraform.tfstate", var.environment)
    region = var.aws_region
  }
}
