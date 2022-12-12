# RDS

resource "aws_db_subnet_group" "my-db-subnet-grp" {
  name       = "main"
  subnet_ids = [aws_subnet.my-database-subnet-1.id, aws_subnet.my-database-subnet-2.id]
tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "my-database" {
  allocated_storage    = 10
  db_subnet_group_name = aws_db_subnet_group.my-db-subnet-grp.name
  
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t3.micro"
  multi_az             = true
  publicly_accessible  = false
  name                 = "mydb"
  username             = "maaran"
  password             = "maaranadmin"
  skip_final_snapshot  = true
  vpc_security_group_ids   = [aws_security_group.db-sg.id]

  tags = {
    Name = "${var.project_name}-database"
  }
}