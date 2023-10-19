# Define AWS as our provider
# This requires a user in the target account with sufficient permissions.
# credentials are in ~/.aws/credentials

provider "aws" {
    region  = var.aws_region
    profile = var.aws_profile
    assume_role {
        role_arn = "arn:aws:iam::${var.aws_account_id}:role/TerraformRole"
    }
}

provider "kubernetes" {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.default.token
}

terraform {
    backend "s3" {}
    required_version = "= 1.0.3"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.19.0"
        }
    }
}