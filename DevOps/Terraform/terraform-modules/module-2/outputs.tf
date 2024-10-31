output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2_module_2.public_ip
}