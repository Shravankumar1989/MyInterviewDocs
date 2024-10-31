# Example - 1
locals {
  staging_env = "staging"
}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.staging_env}-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.staging_env}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0767046d1677be5a0"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.staging-subnet.id
   
   tags = {
           Name = "${local.staging_env} - Terraform EC2"
   }
}

# Example - 2

# Define locals for tags
locals {
  common_tags = {
    Project     = "Project-X"
    Environment = "dev"
    Owner       = "team-ops"
  }
}

# Use the common tags in multiple resources
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t3.micro"

  tags = local.common_tags
}

resource "aws_s3_bucket" "example" {
  bucket = "my-app-bucket"

  tags = local.common_tags
}
