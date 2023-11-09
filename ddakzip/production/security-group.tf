# # Create security group
# resource "aws_security_group" "eb_security_group" {
#   name        = "eb-security-group"
#   description = "Elastic Beanstalk Security Group"

#   ingress {
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 443
#     to_port   = 443
#     protocol  = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }