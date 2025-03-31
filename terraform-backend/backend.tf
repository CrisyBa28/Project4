provider "aws" {
  region = "us-east-1"  # Your AWS region (adjust as needed)
}

# Random suffix to ensure bucket name uniqueness
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# S3 bucket for Terraform state
resource "aws_s3_bucket" "luit-tf-backend-bucket" {
  bucket = "luit-tf-backend-bucket"
  
  # Prevent accidental deletion of this bucket
  lifecycle {
    prevent_destroy = true
  }
  
  tags = {
    Name        = "luit-tf-backend-bucket"
    Environment = "Management"
    ManagedBy   = "Terraform"
  }
}

# Enable versioning so we can see the full revision history of our state files
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.luit-tf-backend-bucket.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.luit-tf-backend-bucket.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create a DynamoDB table for locking the state file
resource "aws_dynamodb_table" "luit-tf-backend-locks" {
  name         = "luit-tf-backend-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
  
  tags = {
    Name        = "luit-tf-backend-locks"
    Environment = "Management"
    ManagedBy   = "Terraform"
  }
}

# Output the bucket details
output "s3_bucket_name" {
  value = aws_s3_bucket.luit-tf-backend-bucket.id
  description = "The name of the S3 bucket"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.luit-tf-backend-locks.id
  description = "The name of the DynamoDB table"
}