variable "env" {
  description = "this is the environment for infra-app"
  type        = string

}

variable "bucket_name" {
  description = "This is the bucket name for my infra-app"
  type        = string
}


variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "ec2_root_storage_size" {
  description = "The size of the root storage for the instance"
  type        = number
  default     = 10
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
}


