# 1. STRING
variable "region" {
    description = "region name"
    type = string
    default = "us-east-1"
}

provider "aws" {
    region = var.region
}

# IMP Notes

#   1.      Override the variable using a .tfvars file (terraform.tfvars):
#           region = "us-east-1"


#   2.      Or, override via CLI:
#           terraform apply -var="region=us-east-1"

# 2. NUMBER
variable "instance_count" {
    description = "Number of EC2 instances"
    type = number
    default = 3

    validation {
        condition     = var.instance_count > 0
        error_message = "The instance_count must be greater than 0."
    }
}


resource "aws_instance" "instance" {
    ami = "ami-id"
    instance_type = "t2.micro"
    count = var.instance_count
}

# IMP Notes

#   1.      Override the variable using a .tfvars file (terraform.tfvars):
#           instance_count = 3

# 3. BOOL
resource "aws_instance" "name" {
    ami = "ami-id"
    instance_type = "t2.micro"
    associate_public_ip_address = var.ip_address_enable
    tags = {
        name = "aws_instance"
    }
}

variable "ip_address_enable" {
    description = "Enable ip address"
    type = bool
    default = true
}


# 4. LIST
resource "aws_iam_user" "user_name" {
    count = length(var.user_name)
    name = var.user_name[count.index]
}

variable "user_name" {
    description = "creating i am user"
    type = list(string)
    default = [ "user1", "user2", "user3"]
}


# 5. MAP
resource "aws_instance" "project_environment" {
    ami = "ami-id"
    instance_type = "t2.micro"
    tags = var.project_environment
}

variable "project_environment" {
    description = "project environment"
    type = map(string)
    default = {
        "project" = "project-alpha",
        "environment" = "dev"
    }
}