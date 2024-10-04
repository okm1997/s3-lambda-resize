# SNS Output Block
output "sns_topic_arn" {
  value = aws_sns_topic.image_resize_sns.arn
}

output "sns_topic_5_arn" {
  value = aws_sns_topic.image_resize_sns_5.arn
}