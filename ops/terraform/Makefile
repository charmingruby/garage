.PHONY: setup-be
setup-be:
	terraform init -backend=true -backend-config="config/${env}/backend.hcl"

.PHONY: plan
plan:
	terraform plan -var-file="config/${env}/terraform.tfvars"