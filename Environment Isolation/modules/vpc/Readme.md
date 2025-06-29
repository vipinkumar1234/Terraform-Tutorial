# Initialize dev environment

cd envs/dev

terraform init

terraform apply -var-file="terraform.tfvars"

# Initialize prod environment

cd ../prod

terraform init

terraform apply -var-file="terraform.tfvars"

# Configure profiles for both envs 

aws configure --profile dev


aws configure --profile prod
