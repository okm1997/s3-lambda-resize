# Backend block
terraform {
  backend "s3" {
    bucket         = "elred-terraform-backend-2"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "s3-tf-state-lock-2"
  }
}
