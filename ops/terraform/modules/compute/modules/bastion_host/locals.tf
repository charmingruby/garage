locals {
  vpc     = data.terraform_remote_state.this.outputs.vpc
  subnets = data.terraform_remote_state.this.outputs.subnets
}
