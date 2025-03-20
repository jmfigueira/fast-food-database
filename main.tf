resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_storage
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  identifier         = var.db_instance_name
  username           = var.db_username
  password           = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = var.db_instance_name
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow inbound MySQL traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # WARNING: Allow only trusted IPs in production!
  }
}
