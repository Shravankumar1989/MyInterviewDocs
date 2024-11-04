
# List S3 Buckets in AWS Using Python 3

To get a list of S3 buckets in AWS using Python 3, you can use the `boto3` library, which is the AWS SDK for Python. Follow these steps to retrieve the bucket list.

## Step 1: Install Boto3

If you haven't installed `boto3` yet, you can install it using pip:

```bash
pip install boto3
```

## Step 2: Create the Python Script

Create a Python script with the following code to list all S3 buckets in your AWS account:

```python
import boto3

# Initialize the S3 client
s3_client = boto3.client('s3')

# Fetch the list of buckets
response = s3_client.list_buckets()

# Print the bucket names
print("List of S3 Buckets:")
for bucket in response['Buckets']:
    print(f"- {bucket['Name']}")
```

## Step 3: Configure AWS Credentials

Ensure your AWS credentials are set up. You can do this by:

1. Configuring the `~/.aws/credentials` file.
2. Setting environment variables (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).
3. Running `aws configure` with the AWS CLI to set up your credentials.

## Step 4: Run the Script

Run the script by executing:

```bash
python your_script_name.py
```

## Expected Output

The script will output a list of bucket names in your AWS account:

```
List of S3 Buckets:
- bucket-name-1
- bucket-name-2
- bucket-name-3
```

## Explanation

- The script initializes the S3 client with `boto3.client('s3')`.
- It then calls the `list_buckets()` method, which retrieves a dictionary containing details about each bucket.
- Finally, it iterates through the buckets and prints their names.

This method provides a quick and effective way to see all S3 buckets in your AWS account.