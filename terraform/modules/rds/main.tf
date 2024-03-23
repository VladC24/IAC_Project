resource "aws_db_instance" "mysql_db" {
  allocated_storage      = var.db_allocated_storage 
  engine                 = "mysql" 
  engine_version         = var.db_engine_version 
  identifier             = "mysql-db" 
  username               = var.username 
  password               = var.password 
  skip_final_snapshot    = true 
  db_subnet_group_name   = aws_db_subnet_group.iacproject_db_subnet_group.name
  instance_class         = var.db_instance_type
}

resource "aws_db_subnet_group" "iacproject_db_subnet_group" {
  name       = "iacproject-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "iacproject-db-subnet-group"
  }
}