#   Step 1: 
#   ----------
#   Write Empty aws_instance resource block- Write an empty terraform resource block for EC2 Instance:

    provider "aws" {
        region     = "eu-central-1"
        shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
    }

    resource "aws_instance" "ec2_example" {

    }


#   Step 2:
#   ----------
#   Run terraform import- Now the terraform import command using the correct resource name .e.g. aws_instance.ec2_example

#   Command - terraform import aws_instance.ec2_example i-097f1ec37854d01c2

#   Step 3:
#   ----------
    resource "aws_instance" "ec2_example" {
        ami            = "ami-06ce824c157700cd2"
        instance_type  = "t2.micro"
        tags = {
            "Name" = "my-test-ec2"
        }
    }

#   Step 3:
#   ----------
#   Verify the import- Now you can verify the terraform import by running the 
#   command terraform plan and it should not create any more resources -

#   Command - terraform plan