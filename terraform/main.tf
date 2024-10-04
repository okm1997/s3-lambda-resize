# S3 Module
module "s3" {
  source         = "./modules/s3-bucket"

  elred_bucket_a = var.elred_bucket_a
  elred_bucket_b = var.elred_bucket_b
}

# Lambda Module
module "lambda" {
  source               = "./modules/lambda"

  lambda_function_name = "image-resizer-function"
  bucket_a_id = module.s3.bucket_a_id
  bucket_a_arn = module.s3.bucket_a_arn
  elred_bucket_b_name = module.s3.elred_bucket_b_name

  sns_topic_arn = module.sns.sns_topic_arn
}

# SNS Module
module "sns" {
  source = "./modules/sns"
}

# Cloudwatch Module
module "cloudwatch" {
  source = "./modules/cloudwatch"

  sns_topic_5_arn = module.sns.sns_topic_5_arn
  lambda_function_name = module.lambda.lambda_function_name
}