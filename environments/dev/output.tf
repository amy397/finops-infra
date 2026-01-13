
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "ec2_public_ip" {
  description = "EC2 퍼블릭 IP"
  value       = module.ec2.public_ip
}

output "ec2_public_dns" {
  description = "EC2 퍼블릭 DNS"
  value       = module.ec2.public_dns
}

output "rds_endpoint" {
  description = "RDS 엔드포인트"
  value       = module.rds.endpoint
}

output "ecr_repository_urls" {
  description = "ECR 레포지토리 URL"
  value       = module.ecr.repository_urls
}