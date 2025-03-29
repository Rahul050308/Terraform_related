variable "ec2_instance_type" {
  description = "The type of AWS instance to launch"
  default = "t2.micro"
  type = string
  
}
variable "ec2_root_storage_size" {
  description = "The size of the root storage for the instance"
  default = 10  
  type = number
  
}

variable "ec2_ami" {
  description = "The AMI to use for the instance"
  default = "ami-0cb91c7de36eed2cb"
  type = string
  
}

# variable "security_groups_terra" {
#   description = "The security group to use for the instance"
#   default = "automate_sg"
#   type = string
  
# }

# variable "ingress_rules" {
#   description = "values for ingress rules"
#   type = list(object({
#     description = string
#     from_port = number
#     to_port = number
#     protocol = string
#     cidr_blocks = list(string)
#   }))

#   default = [ {
#     description = "ssh from vpc"
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   },

#   {
#     description = "http from vpc"
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   },
  
#   {
#     description = "https from vpc"
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   },
#   {
#     description = "Custom TCP Rule"
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#    ]
  
# }

# variable "egress_rules" {
#   description = "values for egress rules"
#   type = list(object({
#     description = string
#     from_port = number
#     to_port = number
#     protocol = string
#     cidr_blocks = list(string)
#   }))

#   default = [
#     {
#       description = "All access to all ports"
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]

# }

variable "environment" {
  description = "The environment to deploy the instance"
  default = "prd"
  type = string
  
}