output "cluster_id" {
  description = "EKS cluster ID (same as cluster name in v20+ module)."
  value       = module.eks.cluster_name
}

output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "oidc_provider_arn" {
  description = "ARN of the OIDC provider for IRSA."
  value       = module.eks.oidc_provider_arn
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data for the cluster."
  value       = module.eks.cluster_certificate_authority_data
}

output "update_kubeconfig_command" {
  description = "Command to update local kubeconfig."
  value       = format("aws eks update-kubeconfig --name %s --region %s", module.eks.cluster_name, var.aws_region)
}
