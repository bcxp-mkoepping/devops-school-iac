# Define AWS as our provider
# This requires a user in the target account with sufficient permissions.
provider "aws" {
    region  = "eu-central-1"
    access_key = "" # TODO add access key from slides!
    secret_key = "" # TODO add secret key from slides!
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


