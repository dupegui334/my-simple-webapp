terraform {
  backend "s3" {
    bucket = "tf-state-david"
    key    = "web-app-tfstate/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "web-app-lock"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "web-app-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}