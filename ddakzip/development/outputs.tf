output "vpc_id" {
    value       = aws_vpc.terraform_vpc.id
    description = "vpc_id"
}

output "subnet1_id" {
    value       = aws_subnet.terra-sub-public1.id
    description = "subnet1_id"
}

output "subnet2_id" {
    value       = aws_subnet.terra-sub-public2.id
    description = "subnet2_id"
}

output "beanstalkappenv-dns" {
    value       = aws_elastic_beanstalk_environment.beanstalkappenv.cname
    description = "cname_prefix"
}

output "account_id" {
    value = data.aws_caller_identity.current.account_id
    description = "account_id"
}

output "caller_arn" {
    value = data.aws_caller_identity.current.arn
    description = "caller_arn"
}

output "caller_user" {
    value = data.aws_caller_identity.current.user_id
    description = "caller_user"
}