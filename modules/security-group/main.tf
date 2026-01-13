# EC2 보안 그룹
  resource "aws_security_group" "ec2" {
    name        = "${var.project_name}-${var.environment}-ec2-sg"
    description = "Security group for EC2 instance"
    vpc_id      = var.vpc_id

    # SSH (원격 접속)
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTP
    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTPS
    ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # Dashboard (React)
    ingress {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # Gateway
    ingress {
      from_port   = 8282
      to_port     = 8282
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # Outbound 전체 허용
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project_name}-${var.environment}-ec2-sg"
    }
  }

  # RDS 보안 그룹
  resource "aws_security_group" "rds" {
    name        = "${var.project_name}-${var.environment}-rds-sg"
    description = "Security group for RDS"
    vpc_id      = var.vpc_id

    # PostgreSQL - EC2에서만 접근 허용
    ingress {
      from_port       = 5432
      to_port         = 5432
      protocol        = "tcp"
      security_groups = [aws_security_group.ec2.id]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project_name}-${var.environment}-rds-sg"
    }
  }