resource "aws_iam_role" "eb_instance_profile" {
  name = "aws-elasticbeanstalk-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "eb_instance_profile" {
  name = "aws-elasticbeanstalk-ec2-role"
  role = aws_iam_role.eb_instance_profile.name
}

# AWSElasticBeanstalkWebTier 정책 추가
resource "aws_iam_role_policy" "web_tier_policy" {
  name        = "AWSElasticBeanstalkWebTierPolicy"
  role        = aws_iam_role.eb_instance_profile.name
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# AWSElasticBeanstalkWorkerTier 정책 추가
resource "aws_iam_role_policy" "worker_tier_policy" {
  name        = "AWSElasticBeanstalkWorkerTierPolicy"
  role        = aws_iam_role.eb_instance_profile.name
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sqs:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# AWSElasticBeanstalkMulticontainerDocker 정책 추가
resource "aws_iam_role_policy" "multicontainer_docker_policy" {
  name        = "AWSElasticBeanstalkMulticontainerDockerPolicy"
  role        = aws_iam_role.eb_instance_profile.name
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ecs:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ecr:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# AWSElasticBeanstalkLogStream을 위한 정책 추가
resource "aws_iam_role_policy" "attach_policy" {
  name   = "ElasticBeanstalkLoggingPolicy"
  role   = aws_iam_role.eb_instance_profile.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:PutLogEvents",
        "logs:CreateLogStream"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
