module "dev-infra-app" {
  source = "./infra-app"

  env            = "dev"
  bucket_name =  "my-infra-app-bucket" # The name of the S3 bucket
  hash_key       = "studentID" # The hash key for the DynamoDB table
  instance_count = 2           # Number of EC2 instances to create
  instance_type  = "t2.micro"  # EC2 instance type
  ec2_ami_id     = "ami-04f167a56786e4b09"

}

module "prd-infra-app" {
  source = "./infra-app"

  env            = "prd"
  bucket_name =  "my-infra-app-bucket" # The name of the S3 bucket
  hash_key       = "studentID" # The hash key for the DynamoDB table
  instance_count = 2           # Number of EC2 instances to create
  instance_type  = "t2.micro"  # EC2 instance type
  ec2_ami_id     = "ami-04f167a56786e4b09"

}

module "stg-infra-app" {
  source = "./infra-app"

  env            = "stg"
  bucket_name =  "my-infra-app-bucket" # The name of the S3 bucket
  hash_key       = "studentID" # The hash key for the DynamoDB table
  instance_count = 2           # Number of EC2 instances to create
  instance_type  = "t2.micro"  # EC2 instance type
  ec2_ami_id     = "ami-04f167a56786e4b09"

}