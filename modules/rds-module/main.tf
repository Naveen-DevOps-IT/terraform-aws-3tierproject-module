resource "aws_db_subnet_group" "main-rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "main-mysql" {
  identifier             = var.db_identifier
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  allocated_storage      = 20
  storage_type           = "gp2"
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.main-rds_subnet_group.name
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = true

  tags = {
    Name = var.db_identifier
  }
}
