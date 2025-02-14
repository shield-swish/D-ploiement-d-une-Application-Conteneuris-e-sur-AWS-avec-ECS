Documentation du Projet Terraform - Cluster EKS sur AWS

1. Introduction

Ce projet utilise Terraform pour déployer un cluster Amazon EKS (Elastic Kubernetes Service) sur AWS en utilisant des modules. Il comprend trois principaux modules :

Network : Création du VPC, sous-réseaux et passerelles NAT

EKS : Déploiement du cluster Kubernetes

Nodes : Configuration des worker nodes avec un Auto Scaling Group

2. Architecture du Projet

Le projet est structuré comme suit :

terraform-eks/
│── main.tf
│── variables.tf
│── outputs.tf
│── modules/
│   ├── network/
│   ├── eks/
│   ├── nodes/

Schéma de l'Architecture AWS

3. Déploiement avec Terraform

Prérequis

Terraform installé

AWS CLI configuré

kubectl installé

---------------------------------------------------------------------
4. Modules Terraform

Module Network

Ce module crée :

Un VPC avec une plage CIDR personnalisée

Deux sous-réseaux privés

Une passerelle NAT

-------------------------------------------------------

Module EKS

Ce module déploie :

Un Cluster EKS

Un rôle IAM attaché au cluster

---------------------------------------------------

Module Nodes

Ce module provisionne :

Un Auto Scaling Group

Un Launch Template avec une AMI EKS optimisée

6. Conclusion

Ce projet permet un déploiement rapide et modulaire d'un cluster EKS. Il peut être étendu avec des services additionnels comme Ingress, Monitoring et Logging.
