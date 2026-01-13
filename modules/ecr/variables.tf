variable "project_name" {
  description = "프로젝트 이름"
  type        = string
}

variable "environment" {
  description = "환경 (dev, prod)"
  type        = string
}

variable "repository_names" {
  description = "ECR 레포지토리 이름 목록"
  type        = list(string)
  default     = [
    "cost-api",
    "cost-collector",
    "alert-service",
    "gateway",
    "dashboard"
  ]
}