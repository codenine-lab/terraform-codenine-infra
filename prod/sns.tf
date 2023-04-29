# resource "aws_sns_topic" "health_updates" {
#   name = "${var.eb_application_name}-${var.eb_environment_name}"
# }

# resource "aws_sns_topic_subscription" "health_updates_sns" {
#     topic_arn                       = "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:${var.eb_application_name}-${var.eb_environment_name}"
#     protocol                        = "email"
#     endpoint                        = "wq0212@naver.com"
#     raw_message_delivery            = "false"
# }