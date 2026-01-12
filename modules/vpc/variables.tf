 /*
 설명:
   - variable = 변수 선언
   - description = 설명 (문서화용)
   - type = 데이터 타입 (string, number, bool, list, map)
   - default = 기본값 (없으면 필수 입력)
 */


 variable "project_name" {
    description = "프로젝트 이름"
    type        = string
  }

  variable "environment" {
    description = "환경 (dev, prod)"
    type        = string
  }

  variable "vpc_cidr" {
    description = "VPC CIDR 블록"
    type        = string
    default     = "10.0.0.0/16"
  }

  variable "public_subnet_cidr" {
    description = "퍼블릭 서브넷 CIDR"
    type        = string
    default     = "10.0.1.0/24"
  }

  variable "private_subnet_cidr" {
    description = "프라이빗 서브넷 CIDR"
    type        = string
    default     = "10.0.10.0/24"
  }

  variable "availability_zone" {
    description = "가용영역"
    type        = string
    default     = "ap-northeast-2a"
  }