
#           its for count
# # Output the public IP addresses of all EC2 instances
# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }

# # Output the public DNS names of all EC2 instances
# output "ec2_public_dns" {
#   value = aws_instance.my_instance[*].public_dns
# }

# # Output the private IP addresses of all EC2 instances
# output "ec2_private_ip" {
#   value = aws_instance.my_instance[*].private_ip
#}
# Output the public IP addresses of all EC2 instances



#             its for for_each
output "ec2_public_ip" {
  value = values(aws_instance.my_instance)[*].public_ip
}

# Output the public DNS names of all EC2 instances
output "ec2_public_dns" {
  value = values(aws_instance.my_instance)[*].public_dns
}

# Output the private IP addresses of all EC2 instances
output "ec2_private_ip" {
  value = values(aws_instance.my_instance)[*].private_ip
}
