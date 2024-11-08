# Define AWS as our provider
# This also defines the possibilities for authentication.
# In our case, credentials will be set through the environment variables shown in the slides.
provider "aws" {
    region = "eu-central-1"
}

terraform {
    backend "s3" {
        bucket   = "bcxp-devops-iac-2024-035384143302-remote-state"
        key      = "participants/maxi.musterfrau/terraform.tfstate" # TODO change to your own name!
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


