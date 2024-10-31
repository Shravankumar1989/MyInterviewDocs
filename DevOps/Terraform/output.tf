# Specify the AWS provider and region
provider "aws" {
  region = var.region
}

# Input variable for AWS region
variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

# Input variable for instance type
variable "intancetype" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

# EC2 instance resource
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a valid AMI ID in your region
  instance_type = var.intancetype

  # Ensuring we get a public IP address by using a public subnet or enabling public IP assignment
  associate_public_ip_address = true

  tags = {
    Name = "MyInstance"
  }
}

# Output the public IP address of the instance
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
  sensitive = true #hide the infromation
}