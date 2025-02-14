module "network" {
  source   = "./modules/network"
  region   = var.region
  vpc_cidr = "10.0.0.0/16"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = module.network.private_subnets
}

module "nodes" {
  source            = "./modules/nodes"
  node_instance_type = "t3.medium"
  desired_capacity  = 2
  min_capacity      = 1
  max_capacity      = 3
  subnet_ids        = module.network.private_subnets
}
