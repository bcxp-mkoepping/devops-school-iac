provider "aws" { }

terraform {
    backend "s3" {
        bucket   = "bcxp-devops-iac-035384143302-remote-state"
        key      = "shared/terraform.tfstate"
        region   = "eu-central-1"
    }
    required_version = "= 1.0.3"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~>5.21.0"
        }
    }
}


