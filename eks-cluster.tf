module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  # Networking
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Allow public access to the cluster API endpoint
  cluster_endpoint_public_access = true

  # Enable IRSA (IAM Roles for Service Accounts)
  enable_irsa = true

  # EKS Managed Node Group defaults
  eks_managed_node_group_defaults = {
    ami_type               = "AL2023_x86_64_STANDARD"   # Use AMI type string, NOT an AMI ID
    instance_types         = ["t3.small"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]

    # Required for nodes to join the cluster
    iam_role_additional_policies = {}
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }

  # Allow cluster creator admin access
  enable_cluster_creator_admin_permissions = true

  tags = {
    cluster     = "demo"
    Environment = "dev"
    Terraform   = "true"
  }
}
