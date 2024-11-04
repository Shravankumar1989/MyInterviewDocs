
# Simple Guide to Create an S3 Bucket in AWS Using Python 3

This guide shows a simple way to create an S3 bucket using Python and the `boto3` library.

## Step 1: Install Boto3

First, install `boto3` if you haven't:

```bash
pip install boto3
```

## Step 2: Write the Script

Create a Python script with the following code. Replace `"your-bucket-name"` with the desired bucket name, and specify the AWS region if needed.

```python
import boto3

# Replace with your bucket name and preferred AWS region
bucket_name = "your-bucket-name"

# Initialize the S3 client
s3_client = boto3.client('s3')

# Create the bucket
s3_client.create_bucket(
    Bucket=bucket_name
)

print(f"Bucket '{bucket_name}' created successfully.")
```

## Step 3: Configure AWS Credentials

Ensure your AWS credentials are configured by:

1. Setting them in `~/.aws/credentials`.
2. Using environment variables (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).
3. Running `aws configure` in the terminal.

## Step 4: Run the Script

Run the script in the terminal:

```bash
python your_script_name.py
```

## Explanation

1. The script initializes an S3 client.
2. It creates the bucket in the specified region if provided, otherwise in the default region.
3. After creation, it confirms the bucket was successfully created.

This code gives you an easy way to create an S3 bucket with minimal setup.