variable "eb_application_name" {
  default = "ddakzip-eb-application"
}
variable "eb_environment_name" {
  default = "ddakzip-eb-environment"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v5.8.0 running Node.js 16"
}
variable "tier" {
  default = "WebServer" 
}

variable "instance_type"{
  default = "t3.micro, t2.micro"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "eb_sns_endpoint_email"{
  default = "wq0212@naver.com"
}

variable "domain_name" {
    type        = string
    default     = "codenine.shop"
    description = "Fully domain name to deploy Web services"
}
