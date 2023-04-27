variable "elasticapp" {
  default = "ddakzip-eb-application"
}
variable "beanstalkappenv" {
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

