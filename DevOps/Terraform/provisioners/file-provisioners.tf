resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbvRN/gvQBhFe+dE8p3Q865T/xTKgjqTjj56p1IIKbq8SDyOybE8ia0rMPcBLAKds+wjePIYpTtRxT9UsUbZJTgF+SGSG2dC6+ohCQpi6F3xM7ryL9fy3BNCT5aPrwbR862jcOIfv7R1xVfH8OS0WZa8DpVy5kTeutsuH5FMAmEgba4KhYLTzIdhM7UKJvNoUMRBaxAqIAThqH9Vt/iR1WpXgazoPw6dyPssa7ye6tUPRipmPTZukfpxcPlsqytXWlXm7R89xAY9OXkdPPVsrQA0XFQnY8aFb9XaZP8cm7EOVRdxMsA1DyWMVZOTjhBwCHfEIGoePAS3jFMqQjGWQd rahul@rahul-HP-ZBook-15-G2"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"          # Ensure this is a valid AMI ID
  instance_type = "t2.micro"

  key_name = aws_key_pair.deployer.key_name  # Associate the key pair with the instance

  # Define the provisioners
  provisioner "file" {
    source      = "setup.sh"         # Local script to be uploaded
    destination = "/tmp/setup.sh"    # Destination on the EC2 instance
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",      # Make the script executable
      "bash /tmp/setup.sh",           # Execute the script
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"        # Default user for Amazon Linux
      private_key = file("~/.ssh/my-key.pem") # Path to your private key
      host        = self.public_ip     # Connect to the instance using its public IP
    }
  }
}