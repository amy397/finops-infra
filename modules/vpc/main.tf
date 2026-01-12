  # VPC 생성
  resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
      Name        = "${var.project_name}-${var.environment}-vpc"
      Environment = var.environment
    }
  }

  # 인터넷 게이트웨이
  resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "${var.project_name}-${var.environment}-igw"
    }
  }

  # 퍼블릭 서브넷
  resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnet_cidr
    availability_zone       = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
      Name = "${var.project_name}-${var.environment}-public-subnet"
    }
  }

  # 프라이빗 서브넷
  resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.private_subnet_cidr
    availability_zone = var.availability_zone

    tags = {
      Name = "${var.project_name}-${var.environment}-private-subnet"
    }
  }

  # 퍼블릭 라우트 테이블
  resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
    }

    tags = {
      Name = "${var.project_name}-${var.environment}-public-rt"
    }
  }

  # 라우트 테이블 연결
  resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
  }
/*
 핵심 개념:
  - resource "타입" "이름" = AWS 리소스 생성
  - var.변수명 = 변수 참조
  - aws_vpc.main.id = 다른 리소스의 속성 참조
  - tags = AWS 태그 (리소스 식별용)
*/