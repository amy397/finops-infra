output "repository_urls" {
  description = "ECR 레포지토리 URL 목록"
  value       = { for k, v in aws_ecr_repository.app : k => v.repository_url }
}

output "repository_arns" {
  description = "ECR 레포지토리 ARN 목록"
  value       = { for k, v in aws_ecr_repository.app : k => v.arn }
}