resource "aws_instance" "example" {
  ami           = "ami-12345678"          # Replace with a valid AMI ID
  instance_type = "t2.micro"
  
  # Define a provisioner to run a local command
  provisioner "local-exec" {
    command = "echo 'EC2 instance ${self.id} has been created!' >> instance_info.txt"
  }
}