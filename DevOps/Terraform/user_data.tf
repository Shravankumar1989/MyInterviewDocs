provider "aws" {
    region = "us-east-1"  # Specify your AWS region
}

# Launch a Debian-based AWS EC2 instance with user_data
resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"  # Replace with the actual Debian AMI ID
    instance_type = "t2.micro"

    key_name      = "example-key"  # Replace with your SSH key name
    security_groups = [aws_security_group.allow_ssh.name]

    # user_data for initialization
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/tmp/hello.txt
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Hello from Terraform on Debian!</h1>" > /var/www/html/index.html
              EOF

    tags = {
        Name = "Terraform-Debian-UserData-Example"
    }
}

# Security group allowing SSH access
resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
  
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Open to the world (for testing)
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"  # All traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "instance_public_ip" {
    value = aws_instance.example.public_ip
}
