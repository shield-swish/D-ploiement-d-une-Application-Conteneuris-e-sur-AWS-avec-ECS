resource "aws_iam_role" "eks_worker_role" {
  name = "eks-worker-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" }, Action = "sts:AssumeRole" }]
  })
}

resource "aws_iam_instance_profile" "eks_worker_profile" {
  name = "eks-worker-profile"
  role = aws_iam_role.eks_worker_role.name
}

data "aws_ssm_parameter" "eks_ami" {
  name = "/aws/service/eks/optimized-ami/1.28/amazon-linux-2/recommended/image_id"
}

resource "aws_launch_template" "eks_worker_template" {
  name_prefix   = "eks-worker"
  image_id      = data.aws_ssm_parameter.eks_ami.value
  instance_type = var.node_instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.eks_worker_profile.name
  }
}

resource "aws_autoscaling_group" "eks_workers" {
  desired_capacity     = var.desired_capacity
  min_size            = var.min_capacity
  max_size            = var.max_capacity
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.eks_worker_template.id
    version = aws_launch_template.eks_worker_template.latest_version
  }
}
