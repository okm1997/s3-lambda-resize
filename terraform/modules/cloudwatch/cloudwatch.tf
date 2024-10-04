# Cloudwatch Alarm
resource "aws_cloudwatch_metric_alarm" "resize_alarm" {
  alarm_name          = "ResizeImagesAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ResizedImages"
  namespace           = "ImageProcessing"
  period              = 600
  statistic           = "Sum"
  threshold           = 5
  alarm_actions       = [var.sns_topic_5_arn]

  dimensions = {
    FunctionName = var.lambda_function_name
  }
}