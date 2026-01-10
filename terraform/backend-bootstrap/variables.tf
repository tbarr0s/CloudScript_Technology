variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome do bucket S3 do Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Tabela DynamoDB para lock do state"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, stage, prod)"
  type        = string
  default     = "dev"
}
