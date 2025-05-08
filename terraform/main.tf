terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws.region
}
 ###DUMMY
provider "kubernetes" {
  host                   = aws_eks_cluster.your_eks_cluster.endpoint ###DUMMY
  cluster_ca_certificate = base64decode(aws_eks_cluster.your_eks_cluster.certificate_authority[0].data) ###DUMMY
  token                  = data.aws_eks_cluster_auth.your_eks_cluster.token ###DUMMY
}