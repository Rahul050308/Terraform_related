# Key pair
resource "aws_key_pair" "deployer" {
  key_name   = "terra-key-ansible" 
  public_key = file("terra-key-ansible.pub")  # Ensure this file exists
}

# VPC and Security Group
resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_security_group" {
  # name   = var.security_groups_terra
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name = "Terraform-Security-Group"
  }
  # Inbound rules
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"   
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"  
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP Rule"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access to all ports"
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  # count = 3 # Create 3 instances meta argument


  for_each = tomap({
    "Master" = "ami-04f167a56786e4b09",
    "Node1" = "ami-04f167a56786e4b09",
    "Node2" = "ami-0f6c1051253397fef"
    "Node3" = "ami-0100e595e1cc1ff7f"
  })
  ami             = each.value              #  Corrected from ec2_ami
  instance_type   = "t2.micro"   #  Corrected from ec2_instance_type
  key_name        = aws_key_pair.deployer.key_name                   

  vpc_security_group_ids = [aws_security_group.my_security_group.id] #  Corrected from security_groups

  tags = {
    Name = each.key #each.key  #  Corrected from Terraform-Instance  

  }
#   user_data = file("install_nginx.sh")  # Ensure this file exists

  root_block_device {
    volume_size = var.ec2_root_storage_size  # ✅ Corrected from ec2_root_storage_size
    volume_type = "gp3"
  }
}
