# -------------------
# Cluster EKS
# -------------------
output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "Versão do Kubernetes no EKS"
  value       = module.eks.cluster_version
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = module.eks.cluster_arn
}

# -------------------
# OIDC (importante para IRSA)
# -------------------
output "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL do cluster"
  value       = module.eks.cluster_oidc_issuer_url
}

output "cluster_oidc_provider_arn" {
  description = "ARN do OIDC provider"
  value       = module.eks.oidc_provider_arn
}

# -------------------
# Fargate
# -------------------
output "fargate_profiles" {
  description = "Perfis Fargate configurados no cluster"
  value       = keys(module.eks.fargate_profiles)
}

# -------------------
# Rede
# -------------------
output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.this.id
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = aws_subnet.private[*].id
}

# -------------------
# Região
# -------------------
output "aws_region" {
  description = "Região AWS utilizada"
  value       = var.aws_region
}
