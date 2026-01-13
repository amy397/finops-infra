# DB 서브넷 그룹
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet"
  }
}

# RDS PostgreSQL 인스턴스
resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-${var.environment}-db"

  # 엔진 설정
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"

  # 스토리지 설정
  allocated_storage    = 20
  storage_type         = "gp2"

  # 데이터베이스 설정
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  # 네트워크 설정
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.security_group_id]
  publicly_accessible    = false

  # 백업 설정 (프리티어)
  backup_retention_period = 0
  skip_final_snapshot     = true

  # 기타 설정
  multi_az               = false
  storage_encrypted      = false

  tags = {
    Name = "${var.project_name}-${var.environment}-db"
  }
}