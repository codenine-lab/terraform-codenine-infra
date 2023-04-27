output "db_address" {
    value       = aws_db_instance.rds_mysql.address
    description = "address"
}

output "db_hosted_zone_id" {
    value       = aws_db_instance.rds_mysql.hosted_zone_id
    description = "hosted_zone_id"
}

output "db_port" {
    value       = aws_db_instance.rds_mysql.port
    description = "port"
}