# Diagrama de Arquitetura — AWS EKS

```mermaid
flowchart TB

    Internet[(Internet)]
    IGW[Internet Gateway]

    subgraph VPC["VPC (10.0.0.0/16)"]
        subgraph Public["Public Subnet"]
            NAT[NAT Gateway]
        end

        subgraph PrivateA["Private Subnet (AZ-a)"]
            EKS[EKS Cluster]
            FargateA[Fargate Pods]
        end

        subgraph PrivateB["Private Subnet (AZ-b)"]
            FargateB[Fargate Pods]
        end
    end

    Internet --> IGW
    IGW --> NAT
    NAT --> EKS
    EKS --> FargateA
    EKS --> FargateB
