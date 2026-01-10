terraform {
  required_version = ">= 1.5.0"

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

# -------------------
# VPC
# -------------------
resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}

# -------------------
# Availability Zones
# -------------------
data "aws_availability_zones" "available" {}

# -------------------
# Subnets Privadas
# -------------------
resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "eks-private-${count.index}"
  }
}

# -------------------
# EKS + Fargate
# -------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.21"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private[*].id

  # 🔥 FIX DEFINITIVO DO ERRO provider_key_arn
  create_kms_key            = false
  cluster_encryption_config = {}

  fargate_profiles = {
    default = {
      name       = var.fargate_profile_name
      subnet_ids = aws_subnet.private[*].id

      selectors = [
        for ns in var.fargate_profile_namespaces : {
          namespace = ns
        }
      ]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
