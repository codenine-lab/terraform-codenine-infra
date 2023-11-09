# Create elastic beanstalk application
resource "aws_elastic_beanstalk_application" "eb_app" {
  name = var.eb_application_name
}

# Create elastic beanstalk Environment
resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = var.eb_environment_name
  application         = aws_elastic_beanstalk_application.eb_app.name
  solution_stack_name = var.solution_stack_name
  tier                = "WebServer" 

  # setting {
  #   namespace = "aws:ec2:vpc"
  #   name      = "VPCId"
  #   value     = aws_vpc.terraform_vpc.id
  # }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.eb_instance_profile.name
  }
  # setting {
  #   namespace = "aws:ec2:vpc"
  #   name      = "AssociatePublicIpAddress"
  #   value     =  "True"
  # }
  # setting {
  #   namespace = "aws:ec2:vpc"
  #   name      = "Subnets"
  #   value     = "default"
  # }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "True"
  }
  setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Endpoint"
    value     = var.eb_sns_endpoint_email
  }
  setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Protocol"
    value     = "email"
  }
  # setting {
  #   namespace = "aws:elasticbeanstalk:sns:topics"
  #   name      = "Notification Topic ARN"
  #   value     = "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:${var.eb_application_name}-${var.eb_environment_name}"
  # }
  # setting {
  #   namespace = "aws:elasticbeanstalk:sns:topics"
  #   name      = "Notification Topic Name"
  #   value     = "${var.eb_application_name}-${var.eb_environment_name}"
  # }
}