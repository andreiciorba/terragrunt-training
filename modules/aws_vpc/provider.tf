terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region_name

  default_tags {
    tags = {
      "application" = "My EKS App"
      "deployedBy"  = "Terragrunt"
    }

  }
}


