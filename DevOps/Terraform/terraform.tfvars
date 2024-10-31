# IMP

# terraform.tfvars – Assigning Values

# terraform apply -var="region=us-east-2" -var="instance_count=3"

region ="us-east-1"

instance_count = 3

ip_address_enable = true

user_name = ["newuser1", "newuser2", "newuser3"]

project_environment = {
  project     = "project-beta"
  environment = "prod"
}