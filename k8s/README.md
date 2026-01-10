# Deploy de Aplicação no Kubernetes (EKS Fargate)

## Aplicação de Exemplo

- Nginx Deployment com 2 réplicas
- Service LoadBalancer para expor porta 80
- Namespace default (ou custom)

## Como aplicar

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## 1. Configuração do `kubectl` para o Cluster EKS

Após criar o cluster EKS, é necessário configurar o `kubectl` para se conectar ao cluster e gerenciar recursos Kubernetes.

---

### 1.1 Pré-requisitos

- AWS CLI instalada e configurada (`aws configure`)  
- `kubectl` instalado (`kubectl version --client`)  
- Cluster EKS provisionado e em execução  

---

### 1.2 Gerar arquivo kubeconfig

Execute o comando abaixo para gerar ou atualizar o arquivo `kubeconfig`:

```bash
aws eks --region <REGIAO> update-kubeconfig --name <NOME_DO_CLUSTER>

---

## 2. Padronização de Commits

Para manter o histórico de commits organizado e facilitar rastreabilidade, revisões e integração com CI/CD, recomenda-se seguir **convenções de commits**.

---

### 2.1 Convenção Recomendada

O padrão mais usado é o **Conventional Commits**:


