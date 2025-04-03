module "dev-infra-app" {
  source = "./infra-app"

  env            = "dev"
  bucket_name    = "infra-app-bucket"
  hash_key       = "studentID" # The hash key for the DynamoDB table
  instance_count = 1           # Number of EC2 instances to create
  instance_type  = "t2.micro"  # EC2 instance type
  ec2_ami_id     = "ami-04f167a56786e4b09"

}