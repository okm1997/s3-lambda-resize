# Lambda Output Block
output "lambda_function_name" {
  value = aws_lambda_function.resize_lambda.function_name
}