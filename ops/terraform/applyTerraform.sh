echo "Applying...."
ENV=dev

terraform apply -var-file="$ENV/inputs.tfvars" -auto-approve