# Infraestrutura AWS com Terraform – VPC + EKS

## 📌 Visão Geral

Este projeto implementa uma infraestrutura na AWS utilizando **Terraform**, com foco em **boas práticas de Infraestrutura como Código (IaC)**, segurança e arquitetura moderna para **Kubernetes com Amazon EKS**.

A solução foi desenvolvida como parte de um **desafio técnico DevOps**, demonstrando domínio em provisionamento de infraestrutura, organização de código, troubleshooting e tomada de decisões técnicas.

### Principais componentes

- VPC customizada  
- Cluster Amazon EKS  
- Subnets públicas e privadas em múltiplas Availability Zones  
- NAT Gateway para saída controlada à internet  
- Suporte a **EKS Fargate**  
- Backend remoto do Terraform (**S3 + DynamoDB**)  
- Políticas IAM seguindo o princípio do menor privilégio  

---

## 🏗 Arquitetura

A infraestrutura é composta por:

- **VPC** com CIDR customizado  
- **Subnets privadas** para workloads Kubernetes  
- **Internet Gateway** para conectividade externa  
- **NAT Gateway** permitindo acesso à internet a partir das subnets privadas  
- **Amazon EKS**  
- **Fargate Profile** para execução de pods sem gerenciamento de instâncias EC2  
- **Backend remoto do Terraform**, utilizando:  
  - Amazon S3 para armazenamento do state  
  - Amazon DynamoDB para lock e controle de concorrência  

📐 Um diagrama da arquitetura pode ser encontrado na pasta `/diagrams`.

---

## 📁 Estrutura do Projeto

terraform/  
├── main.tf                  # Infraestrutura principal (VPC + EKS + Fargate)  
├── variables.tf             # Variáveis do projeto  
├── outputs.tf               # Outputs relevantes  
├── backend.tf               # Configuração do backend remoto  
├── backend-bootstrap.tf     # Criação do S3 e DynamoDB para o state  

---

## ⚙️ Decisões Técnicas

- A **VPC foi criada manualmente**, garantindo maior controle sobre a topologia de rede  
- O **EKS utiliza apenas subnets privadas**, reduzindo a superfície de exposição  
- O **EKS Fargate** foi adotado para eliminar a necessidade de gerenciamento de nós EC2  
- O **backend remoto do Terraform** garante:  
  - Estado centralizado  
  - Lock de concorrência  
  - Maior segurança e rastreabilidade  
- As políticas IAM seguem o **princípio do menor privilégio**  
- Foram aplicadas **boas práticas recomendadas pela AWS**  

O código foi validado com:

terraform init  
terraform validate  
terraform plan  

---

## 🚧 Dificuldades Encontradas

- Ajuste fino das permissões IAM necessárias para a execução do Terraform  
- Criação do NAT Gateway exigindo permissões adicionais relacionadas a Elastic IP  
- Tempo de propagação de permissões IAM durante os testes iniciais  
- Ajustes de compatibilidade com versões do módulo oficial do EKS  

Esses desafios foram resolvidos por meio de políticas customizadas, validação contínua com `terraform validate` e revisão incremental do `terraform plan`.

---

## 🚫 Limitação da Conta AWS

Durante a execução do desafio, a conta AWS utilizada encontrava-se **em processo de verificação pela própria AWS**, conforme mensagem oficial retornada pelo console:

“Não é possível criar o ambiente. A verificação da sua conta está em andamento. Isso pode levar até dois dias para novas contas.”

---

### Impacto

Devido a esse bloqueio administrativo, **não foi possível**:

- Criar instâncias EC2  
- Provisionar **EKS Managed Node Groups**  
- Criar ambientes gerenciados dependentes de EC2  

---

### Importante

Essa limitação ocorre **em nível de conta AWS** e **não está relacionada** a:

- Código Terraform  
- Configuração de VPC  
- Configuração do EKS  
- IAM Roles  
- Versões de provider ou módulos  

Toda a infraestrutura foi validada com sucesso via `terraform validate`, `terraform plan` e criação de recursos não bloqueados (VPC, subnets, backend remoto, cluster EKS).

---

### Situação Atual

A AWS informa que a liberação pode levar até **48 horas** para contas novas.  
Após a liberação, o provisionamento completo do ambiente poderá ser executado **sem necessidade de alterações no código**.

---

### Mensagem de Erro

This account is currently blocked and not recognized as a valid account.  
Launching EC2 instance failed.

---

### Causa Raiz

A conta AWS encontra-se **bloqueada ou em processo de verificação**, impedindo o lançamento de instâncias EC2.

Esse bloqueio ocorre **em nível de conta** e não está relacionado a:

- Código Terraform  
- Configuração do EKS  
- IAM Roles  
- Limites de instância  
- Erros de sintaxe ou versões de provider  

---

### Impacto Observado

- VPC criada com sucesso  
- Subnets públicas e privadas criadas corretamente  
- Internet Gateway e rotas aplicadas  
- Cluster EKS criado com sucesso  
- Falha apenas na criação do **Node Group**, devido à impossibilidade de lançar instâncias EC2  

---

### Evidência Técnica

AsgInstanceLaunchFailures: This account is currently blocked and not recognized as a valid account.

---

## ▶️ Como Executar

cd terraform  
terraform init  
terraform validate  
terraform plan  
# terraform apply (apenas se a conta estiver desbloqueada)  

⚠️ Certifique-se de que a região AWS configurada no provider seja compatível com o EKS (ex: us-east-1).

---

## 🧠 Possíveis Evoluções

- Modularização da infraestrutura (VPC, EKS, IAM)  
- Suporte a múltiplos ambientes (dev, staging, prod)  
- Integração com CI/CD para validação automática do Terraform  
- Implementação de GitOps com ArgoCD ou Flux  

---

## 💡 Melhorias Opcionais

- Controle de acesso **RBAC** refinado no EKS  
- Uso de **AWS KMS** para criptografia de secrets  
- **Auto Scaling** baseado em métricas customizadas  
- Habilitação de logs e métricas avançadas  

