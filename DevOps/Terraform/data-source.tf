#   Definition:- 
#   Terraform data sources allow you to fetch information from outside your current Terraform configuration.

provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   tags = {
           Name = "Terraform EC2"
   }
}

data "aws_instance" "myawsinstance" {
    filter {
      name = "tag:Name"
      values = ["Terraform EC2"]
    }
    depends_on = [
      aws_instance.ec2_example
    ]
}

output "instance_id" {
  value = data.aws_instance.myawsinstance.id
}

output "public_ip" {
  value = data.aws_instance.myawsinstance.public_ip
}