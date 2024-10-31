variable "allowed_ports" {
  type = list(object({
    port     = number
    protocol = string
    description = string
  }))
  default = [
    {
      port        = 22
      protocol    = "tcp"
      description = "Allow SSH"
    },
    {
      port        = 80
      protocol    = "tcp"
      description = "Allow HTTP"
    },
    {
      port        = 443
      protocol    = "tcp"
      description = "Allow HTTPS"
    }
  ]
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  vpc_id      = "vpc-12345678"  # Replace with your actual VPC ID

  # Dynamic block to create multiple ingress rules
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]   # Allow traffic from anywhere
      description = ingress.value.description
    }
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"             # "-1" means all protocols
    cidr_blocks = ["0.0.0.0/0"]    # Allow all outbound traffic
  }

  tags = {
    Name = "example-sg"
  }
}

# Example-2

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   }]
}

resource "aws_security_group" "main" {
   name   = "resource_with_dynamic_block"
   vpc_id = data.aws_vpc.main.id

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   tags = {
      Name = "AWS security group dynamic block"
   }
}