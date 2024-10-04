# Lambda Function
resource "aws_lambda_function" "resize_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.8"
  handler       = "lambda_function_unzipped.lambda_handler"
  timeout       = "900"
  filename      = "./lambda_function.zip"        
  source_code_hash = filebase64sha256("lambda_function.zip")

  environment {
    variables = {
      TARGET_BUCKET = "${var.elred_bucket_b_name}"
      SNS_TOPIC_ARN = "${var.sns_topic_arn}"
    }
  }
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = "${var.bucket_a_id}"
    lambda_function {
      lambda_function_arn = aws_lambda_function.resize_lambda.arn
      events              = ["s3:ObjectCreated:*"]
      filter_suffix       = ".png"
    }
  depends_on = [ aws_s3_bucket_notification.aws-lambda-trigger ]
}