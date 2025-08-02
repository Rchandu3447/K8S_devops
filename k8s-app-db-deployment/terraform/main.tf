provider "aws" {
  region = var.region
}

resource "aws_db_instance" "app_db" {
  identifier = "${var.env}-db"
  engine = "postgres"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  db_name = "appdb"
  username = "admin"
  password = "YourSecurePass123"
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = [var.db_security_group_id]
  skip_final_snapshot = true
}
