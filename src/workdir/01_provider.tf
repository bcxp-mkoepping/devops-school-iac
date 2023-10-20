# Define AWS as our provider
# This requires a user in the target account with sufficient permissions.
provider "aws" {
    region  = "eu-central-1"
    access_key = "AKIAQQPIPFXDH4U26S6C"
    secret_key = "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"
}

terraform {
    backend "s3" {
        bucket   = "bcxp-devops-iac-2023-035384143302-remote-state"
        key      = "participants/maxi.musterfrau/terraform.tfstate" # TODO change to your own name!
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


