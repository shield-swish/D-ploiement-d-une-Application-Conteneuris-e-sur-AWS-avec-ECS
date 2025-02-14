Documentation du Projet Terraform - Cluster EKS sur AWS

Pourquoi utiliser Terraform et AWS EKS ?

Automatisation : Terraform permet de décrire l'infrastructure sous forme de code (Infrastructure as Code - IaC) et de la provisionner en un seul clic.
Scalabilité : AWS EKS offre une gestion simplifiée des clusters Kubernetes avec un support natif du scaling automatique des nœuds.
Sécurité : Intégration des rôles IAM, des sous-réseaux privés, et des politiques de contrôle pour un déploiement sécurisé.
Flexibilité : L'utilisation des modules Terraform permet de réutiliser et d’adapter facilement le projet à différents environnements (DEV, TEST, PROD).

Cas d’usage du projet :

Déployer un cluster Kubernetes sur AWS pour :
Héberger des applications microservices
Tester des applications CI/CD en production
Gérer des workloads Big Data & Machine Learning
Faciliter le déploiement d'applications cloud-native

1. Introduction

Ce projet utilise Terraform pour déployer un cluster Amazon EKS (Elastic Kubernetes Service) sur AWS en utilisant des modules. Il comprend trois principaux modules :

Network : Création du VPC, sous-réseaux et passerelles NAT

EKS : Déploiement du cluster Kubernetes

Nodes : Configuration des worker nodes avec un Auto Scaling Group

2. Architecture du Projet

Le projet est structuré comme suit :

terraform-eks : main.tf / variables.tf / outputs.tf

modules : network / eks / nodes

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

Ce projet a pour objectif de déployer un cluster Kubernetes (EKS) sur AWS en utilisant Terraform. Il vise à automatiser la création d'une infrastructure scalable, sécurisée et modulaire en suivant les bonnes pratiques DevOps.
