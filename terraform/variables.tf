## Variables block
# Provider Block Variables
variable "aws_region" {}
variable "terraform_infrastructure_deploy_role_arn" {}
variable "session_name" {}

# # Lambda Module Variables
variable "lambda_function_name" {}

# S3 Bucket Variables
variable "elred_bucket_a" {}
variable "elred_bucket_b" {}
