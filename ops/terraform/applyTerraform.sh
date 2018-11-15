ENV=$1
echo "Applying for $ENV"

terraform apply -var-file="$ENV/inputs.tfvars" -auto-approve