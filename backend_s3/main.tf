terraform {
  required_version = ">= 0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    profile              = "account-prd"
    bucket               = "carlosanhaya-terraform-backend-state"
    workspace_key_prefix = "us-east-1"
    key                  = "tfstate"
    region               = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "account-${terraform.workspace}"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}