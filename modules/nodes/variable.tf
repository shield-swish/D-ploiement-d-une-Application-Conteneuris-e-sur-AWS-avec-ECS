variable "node_instance_type" {}
variable "desired_capacity" {}
variable "min_capacity" {}
variable "max_capacity" {}
variable "subnet_ids" { type = list(string) }
