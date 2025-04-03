resource "aws_key_pair" "infra_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("infra-app-key.pub")

  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_security_group" {
  name = "${var.env}-infra-app-sg"
  vpc_id = aws_default_vpc.default.id
  description = "Security group for the infrastructure application"

  tags = {
    Name        = "infra-app-sg-${var.env}"
    Environment = var.env
  }

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access"
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
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  count                  = var.instance_count
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name        = "${var.env}-infra-app-instance-${count.index + 1}"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.ec2_root_storage_size == "prd" ? 20 : 10
    volume_type = "gp3"
  }
}
