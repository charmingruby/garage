# https://developer.hashicorp.com/terraform/language/settings/backends/s3

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Project   = "Garage"
      Component = "Remote State"
      CreatedAt = "2024-07-03"
      ManagedBy = "Terraform"
      Owner     = "Gustavo Dias"
    }
  }
}
