terraform {
  backend "s3" {
    bucket         = "luit-tf-backend-bucket"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "luit-tf-backend-locks"
    encrypt        = true
  }
}