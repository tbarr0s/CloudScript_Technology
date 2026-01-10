# COMMIT_GUIDELINES.md

# COMMIT GUIDELINES – Projeto Terraform/EKS

Este guia define o padrão de commits para o projeto, utilizando a convenção:

<tipo>[escopo opcional]: <mensagem>

- <tipo>: indica o tipo de mudança
- [escopo opcional]: módulo ou área do projeto afetada
- <mensagem>: descrição curta e imperativa da mudança

---

## 1️⃣ Tipos de Commits

| Tipo     | Significado |
|----------|------------|
| feat     | Adição de nova funcionalidade ou recurso |
| fix      | Correção de bug ou ajuste |
| chore    | Mudanças administrativas, atualizações de configuração, reorganização |
| refactor | Refatoração de código ou infraestrutura sem alterar comportamento |
| docs     | Alteração ou adição de documentação |

---

## 2️⃣ Escopos sugeridos

| Escopo        | Exemplos de uso |
|---------------|----------------|
| vpc           | Recursos de VPC, subnets, NAT, IGW |
| eks           | Cluster EKS, outputs do cluster |
| fargate       | Fargate profiles e configurações associadas |
| terraform     | Backend remoto, variáveis, outputs, configurações gerais |
| readme        | Atualização de README.md ou documentação do projeto |
| kubectl       | Instruções de configuração do `kubectl` |
| diagrams      | Diagrama de arquitetura do projeto |
| app           | Deploys de aplicações Kubernetes |
| ingress       | Configuração de ingress no Kubernetes |

---

## 3️⃣ Exemplos de commits

### Infraestrutura (VPC, Subnets, NAT, IGW)
feat(vpc): criar VPC principal com CIDR 10.0.0.0/16  
chore(vpc): adicionar tags para monitoramento  
fix(vpc): corrigir CIDR das subnets privadas  
refactor(vpc): reorganizar recursos em blocos lógicos  

### Cluster EKS
feat(eks): criar cluster EKS versão 1.29  
fix(eks): corrigir outputs do cluster sem Node Group  
refactor(eks): separar configuração do cluster em módulo próprio  
chore(eks): atualizar tags do cluster  

### Fargate Profile
feat(fargate): adicionar fargate profile default  
fix(fargate): corrigir selectors do profile  
chore(fargate): atualizar subnet_ids utilizados  

### Terraform (backend, outputs, variáveis)
feat(terraform): adicionar backend remoto S3 + DynamoDB  
fix(terraform): corrigir outputs seguros sem Node Group  
chore(terraform): reorganizar variables.tf e outputs.tf  
docs(terraform): atualizar README com execução e outputs  

### Documentação (README, kubectl, diagramas)
docs(readme): atualizar visão geral do projeto  
docs(kubectl): incluir instruções de configuração  
docs(diagrams): adicionar diagrama de arquitetura básico  

### Aplicações / Deploys Kubernetes
feat(app): criar deployment nginx com 2 replicas  
feat(ingress): adicionar ingress para aplicação web  
fix(ingress): corrigir host e serviceName do ingress  
chore(app): atualizar namespace default no deployment  

---

## 4️⃣ Boas práticas

1. Use mensagem curta e imperativa (ex: `criar`, `corrigir`, `adicionar`)  
2. Inclua o escopo sempre que possível  
3. Mantenha o histórico limpo e organizado  
4. Commits pequenos e significativos são preferíveis  
5. Atualize a documentação quando necessário (`docs`)  

---

## 5️⃣ Exemplo de uso

```bash
git add .
git commit -m "feat(eks): criar cluster EKS básico com Fargate"
git push origin main
