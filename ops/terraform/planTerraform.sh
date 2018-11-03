ENV=$1
echo "Planning for $ENV"

terraform init -backend-config="$ENV/backend.tfvars"
terraform plan