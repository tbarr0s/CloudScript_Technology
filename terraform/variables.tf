# -------------------
# Região AWS
# -------------------
variable "aws_region" {
  description = "Região AWS onde os recursos serão provisionados"
  type        = string
  default     = "us-east-1"
}

# -------------------
# Nome do Cluster EKS
# -------------------
variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-desafio"
}

# -------------------
# Versão do Kubernetes
# -------------------
variable "cluster_version" {
  description = "Versão do Kubernetes do EKS"
  type        = string
  default     = "1.29"
}

# -------------------
# Managed Node Group
# -------------------
variable "node_group_desired_size" {
  description = "Número de instâncias desejadas no Node Group"
  type        = number
  default     = 1
}

variable "node_group_min_size" {
  description = "Número mínimo de instâncias no Node Group"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Número máximo de instâncias no Node Group"
  type        = number
  default     = 1
}

variable "node_group_instance_type" {
  description = "Tipo de instância EC2 para o Node Group"
  type        = string
  default     = "t3.medium"
}

# -------------------
# Fargate Profile
# -------------------
variable "fargate_profile_name" {
  description = "Nome do Fargate Profile"
  type        = string
  default     = "default-fargate"
}

variable "fargate_profile_namespaces" {
  description = "Namespaces que serão executados no Fargate"
  type        = list(string)
  default     = ["default", "kube-system"]
}

variable "fargate_profile_subnet_ids" {
  description = "Lista de subnets para o Fargate Profile (opcional)"
  type        = list(string)
  default     = []
}
