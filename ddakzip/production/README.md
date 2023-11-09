### variable.tf

```variable "eb_application_name" {
  default = "ddakzip-eb-application"
}
variable "eb_environment_name" {
  default = "ddakzip-eb-environment"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2023 v6.0.2 running Node.js 18" # https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.nodejs
}

variable "instance_type"{
  default = "t3.micro, t2.micro"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "eb_sns_endpoint_email"{
  default = ""
}

variable "domain_name" {
    type        = string
    default     = ""
    description = "Fully domain name to deploy Web services"
}

```
