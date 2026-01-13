
variable "project_name" {
  description = "프로젝트 이름"
  type        = string
}

variable "environment" {
  description = "환경 (dev, prod)"
  type        = string
}

variable "subnet_ids" {
  description = "RDS 서브넷 ID 목록"
  type        = list(string)
}

variable "security_group_id" {
  description = "RDS 보안 그룹 ID"
  type        = string
}

variable "db_name" {
  description = "데이터베이스 이름"
  type        = string
  default     = "finops"
}

variable "db_username" {
  description = "데이터베이스 사용자명"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "데이터베이스 비밀번호"
  type        = string
  sensitive   = true
}