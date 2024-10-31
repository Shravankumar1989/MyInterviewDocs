#   The Amazon EC2 Instance depends on the Amazon S3 bucket, 
#   so it needs to be created the bucket before creating the EC2 instance. 
#   To specify this dependency, you would use the "depends_on" argument in the object resource block of EC2 Instance, 
#   like this


#Step 1 - Create S3 Bucket first
resource "aws_s3_bucket" "example_bucket" {
    bucket = "example-bucket"
}

#Step 2 - Create EC2 instance after S3 Bucket
resource "aws_instance" "example_instance" {
    ami           = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    # Define the dependency on S3 Bucket before creating EC2
    depends_on = [aws_s3_bucket.example_bucket]
}