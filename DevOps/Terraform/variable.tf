# IMP

# variables.tf – Defining Variables

# terraform apply -var="region=us-east-2" -var="instance_count=3"

variable "region" {
    description = "region name"
    type = string
    default = "us-east-1"
}

variable "instance_count" {
    description = "Number of EC2 instances"
    type = number
    default = 3

    validation {
        condition     = var.instance_count > 0
        error_message = "The instance_count must be greater than 0."
    }
}

variable "ip_address_enable" {
    description = "Enable ip address"
    type = bool
    default = true
}

variable "user_name" {
    description = "creating i am user"
    type = list(string)
    default = [ "user1", "user2", "user3"]
}

variable "project_environment" {
    description = "project environment"
    type = map(string)
    default = {
        "project" = "project-alpha",
        "environment" = "dev"
    }
}