# Define an AWS DynamoDB table resource named "basic-dynamodb-table"
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  # Specify the table name
  name           = "rhs-dynamodb-table"

  # Set the billing mode to on-demand (pay per request)
  billing_mode   = "PAY_PER_REQUEST"

  # Define the partition key (also known as the hash key)
  hash_key       = "LockID"

  # Define attributes for the table
  attribute {
    # Name of the attribute
    name = "LockID"

    # Data type of the attribute: S (String)
    type = "S"
  }

  # Assign tags to the table for identification and organization
  tags = {
    Name = "rhs-dynamodb-table"
  }
}
