resource "aws_db_instance" "rds_mysql" {
    identifier           = "ddakzip-terraform-db"
    allocated_storage    = 10
    db_name              = "ddakzip_db"
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    username             = var.db_username
    password             = var.db_password

    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    publicly_accessible =  true
}