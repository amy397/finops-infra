variable "project_name" {
  description = "프로젝트 이름"
  type        = string
}

variable "environment" {
  description = "환경 (dev, prod)"
  type        = string
}

variable "subnet_id" {
  description = "EC2가 위치할 서브넷 ID"
  type        = string
}

variable "security_group_id" {
  description = "EC2 보안 그룹 ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH 키페어 이름"
  type        = string
}