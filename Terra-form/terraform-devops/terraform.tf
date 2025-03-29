terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
  backend "s3" {
    bucket = "rhs-bucket-0522"  # Must be globally unique
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "rhs-dynamodb-table"
  }
}