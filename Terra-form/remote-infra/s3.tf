resource "aws_s3_bucket" "remote-s3-bucket" {
  bucket = "rhs-bucket-0522"  # Must be globally unique

  tags = {
    Name        = "rhs-bucket-0522"
  }
}