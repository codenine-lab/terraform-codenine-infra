resource "aws_s3_bucket" "s3-bucket-tfstate" {
  bucket = "s3-bucket-ddakzip-tfstate"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3-bucket-tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-tfstate-lock"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}