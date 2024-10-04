# SNS Topic and Subscriptions
resource "aws_sns_topic" "image_resize_sns" {
  name = "image-resize-sns"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.image_resize_sns.arn
  protocol  = "email"
  endpoint  = "raahel@elred.io"
}

resource "aws_sns_topic" "image_resize_sns_5" {
  name = "image-resize-sns-5-times"
}

resource "aws_sns_topic_subscription" "vignesh_email_alarm_subscription" {
  topic_arn = aws_sns_topic.image_resize_sns_5.arn
  protocol  = "email"
  endpoint  = "vignesh@elred.io"
}

resource "aws_sns_topic_subscription" "raahel_email_alarm_subscription" {
  topic_arn = aws_sns_topic.image_resize_sns_5.arn
  protocol  = "email"
  endpoint  = "raahel@elred.io"
}
