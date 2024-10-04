# Lambda Role and Permissions
resource "aws_iam_role" "lambda_role" {
  name = "lambda-resize-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda-s3-sns-policy"
  description = "Policy for Lambda to access S3 and send SNS notifications"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = "arn:aws:s3:::*/*"
      },
      {
        Action   = "sns:Publish"
        Effect   = "Allow"
        Resource = var.sns_topic_arn
      },
      {
        Action   = "cloudwatch:PutMetricData"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# S3 Lamda Invoke Permissions
resource "aws_lambda_permission" "test" {
statement_id  = "AllowS3Invoke"
action        = "lambda:InvokeFunction"
function_name = aws_lambda_function.resize_lambda.arn
principal = "s3.amazonaws.com"
source_arn = var.bucket_a_arn
}


