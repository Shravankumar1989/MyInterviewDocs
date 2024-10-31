# Types of IAM Policies

## 1. Managed Policies

### 1.1 AWS Managed Policies
   - Pre-built, maintained by AWS.

   **Examples:**
   - AmazonEC2FullAccess
   - AmazonEC2ReadOnlyAccess
   - AmazonS3FullAccess
   - AmazonS3ReadOnlyAccess
   - AmazonVPCFullAccess
   - AdministratorAccess

### 1.2 Customer Managed Policies
   - Custom, created and managed by you.

## 2. Inline Policies
   - Tied directly to one specific user, group, or role.

# What is an IAM Policy?

1. An IAM Policy is a JSON document that defines permissions.

2. It consists of statements containing:

   - **Effect**: "Allow" allows the action.
   - **Action**: "s3:PutObject" allows the user to upload objects to an S3 bucket.
   - **Resource**: "arn:aws:s3:::example-bucket/*" specifies that the action is allowed only for objects in the example-bucket.

3. **Example:**
   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Effect": "Allow",
               "Action": "s3:PutObject",
               "Resource": "arn:aws:s3:::example-bucket/*"
           }
       ]
   }
