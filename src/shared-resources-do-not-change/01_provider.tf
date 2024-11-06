provider "aws" {
    region = "eu-central-1"
}

terraform {
    backend "s3" {
        bucket   = "bcxp-devops-iac-035384143302-remote-state"
        key      = "shared/terraform.tfstate"
        region   = "eu-central-1"
    }
    required_version = "= 1.9.8"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~>5.74.0"
        }
    }
}


