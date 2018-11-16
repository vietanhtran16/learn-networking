echo "Planning...."
ENV=dev

terraform init -backend-config="$ENV/backend.tfvars"
terraform plan -var-file="$ENV/inputs.tfvars"