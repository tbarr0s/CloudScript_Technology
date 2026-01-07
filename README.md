# Infraestrutura AWS com Terraform – VPC + EKS

## 📌 Visão Geral
Este projeto implementa uma infraestrutura básica na AWS utilizando **Terraform**, contendo:

- Uma **VPC customizada**
- Um **cluster Amazon EKS funcional**
- Subnets públicas e privadas em múltiplas AZs
- NAT Gateway para saída controlada à internet
- Node Group gerenciado
- Políticas IAM seguindo o princípio do menor privilégio

---

## 🏗 Arquitetura

A infraestrutura é composta por:

- **VPC** com CIDR customizado
- **Subnets públicas**: Load Balancers e NAT Gateway
- **Subnets privadas**: Worker Nodes do EKS
- **Internet Gateway** para acesso externo
- **NAT Gateway** para acesso à internet a partir das subnets privadas
- **Amazon EKS** com Node Group gerenciado
- **IAM Roles** separadas para Cluster e Nodes

> Um diagrama da arquitetura pode ser encontrado na pasta `/diagrams`.

---

## 📁 Estrutura do Projeto

```text
terraform/
├── main.tf          # Recursos principais (EKS, VPC bindings)
├── vpc.tf           # Definição da VPC, subnets, gateways e rotas
├── iam.tf           # Roles e policies do EKS e Node Groups
├── variables.tf     # Variáveis reutilizáveis
├── outputs.tf       # Outputs importantes (endpoint, cluster name)
└── provider.tf      # Configuração do provider AWS

## ⚙️ Decisões Técnicas

- A VPC foi criada do zero para garantir maior controle sobre a topologia de rede e facilitar a integração com o Amazon EKS
- Os Worker Nodes do EKS são executados exclusivamente em subnets privadas, reduzindo a superfície de exposição
- Um NAT Gateway foi utilizado para permitir acesso seguro à internet a partir das subnets privadas
- Foram utilizadas **políticas gerenciadas oficiais da AWS** sempre que possível, reduzindo complexidade operacional
- As responsabilidades de IAM foram claramente separadas entre o cluster EKS e os node groups
- O Terraform foi adotado como ferramenta de IaC para garantir reprodutibilidade, versionamento e padronização da infraestrutura

## 🚧 Dificuldades Encontradas

- Ajuste fino das permissões IAM necessárias para a execução do Terraform
- Criação do NAT Gateway exigindo permissões adicionais relacionadas a Elastic IP
- Tempo de propagação de permissões IAM durante os testes iniciais

Esses desafios foram resolvidos por meio da criação de políticas customizadas, validação contínua com `terraform validate` e revisão incremental do `terraform plan`.

---
## ▶️ Como Executar

```bash
cd terraform
terraform init
terraform validate
terraform plan


## 🧠 Possíveis Evoluções

- Uso de backend remoto (ex: S3 + DynamoDB) para controle de estado
- Modularização da infraestrutura (VPC, EKS, IAM)
- Integração com CI/CD para validação automática do Terraform
- Habilitação de logs e métricas do cluster EKS

## 💡 Melhorias Opcionais 

### 1. Pequena nota sobre **região AWS**
Você pode adicionar em *Como Executar*:

> Certifique-se de que a região AWS configurada no provider seja compatível com o EKS (ex: us-east-1).

