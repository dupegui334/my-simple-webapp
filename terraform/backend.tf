terraform {
  backend "s3" {
    bucket = "tf-state-david"
    key    = "web-app-tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}