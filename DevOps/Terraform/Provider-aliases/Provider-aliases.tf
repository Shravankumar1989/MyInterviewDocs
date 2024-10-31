provider "aws" {
  alias   = "us-west"
  region  = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias   = "us-east"
  region  = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "west_instance" {
  provider      = aws.us-west
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "aws_instance" "east_instance" {
  provider      = aws.us-east
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
