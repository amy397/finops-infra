terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC 모듈
module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
}

# Security Group 모듈
module "security_group" {
  source = "../../modules/security-group"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

# EC2 모듈
module "ec2" {
  source = "../../modules/ec2"

  project_name      = var.project_name
  environment       = var.environment
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.ec2_security_group_id
  key_name          = var.key_name
}

# RDS 모듈
module "rds" {
  source = "../../modules/rds"

  project_name      = var.project_name
  environment       = var.environment
  subnet_ids        = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  security_group_id = module.security_group.rds_security_group_id
  db_password       = var.db_password
}

# ECR 모듈
module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}