variable "kubernetes_version" {
  default     = "1.35"
  description = "Kubernetes version for the EKS cluster"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "Default CIDR range of the VPC"
}

variable "aws_region" {
  default     = "ap-south-1"
  description = "AWS region to deploy resources"
}
