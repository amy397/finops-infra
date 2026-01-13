 output "vpc_id" {
    description = "VPC ID"
    value       = aws_vpc.main.id
  }

  output "public_subnet_id" {
    description = "퍼블릭 서브넷 ID"
    value       = aws_subnet.public.id
  }

  output "private_subnet_id" {
    description = "프라이빗 서브넷 ID"
    value       = aws_subnet.private.id
  }

  output "private_subnet_id_2" {
    description = "두 번째 프라이빗 서브넷 ID"
    value       = aws_subnet.private_2.id
  }
/*
  설명:
  - output = 다른 모듈에서 사용할 수 있도록 값을 내보냄
  - EC2 모듈에서 module.vpc.vpc_id 로 참조 가능*/