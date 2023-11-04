# Any IP can access to DB's 3306 port
resource "aws_security_group" "rds_sg" {
  name        = "rds-allow-3306"
  description = "Allow incoming traffic on 3306"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# MySQL RDS for main DB
resource "aws_db_instance" "rds_mysql" {
    identifier           = "codenine-terraform-db"
    allocated_storage    = 10
    db_name              = var.db_name
    engine               = "mysql"
    engine_version       = "8.0.33"
    instance_class       = "db.t3.micro"
    username             = var.username
    password             = var.password

    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    publicly_accessible =  true

    vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

# Show Endpoint(Host)
output "rds_endpoint" {
    value = "${aws_db_instance.rds_mysql.endpoint}"
}