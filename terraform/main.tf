variable "region" { default = "us-west-1" }

locals {
	tags = {
		Project = "twitterarchive.gaunt.dev"
	}
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45"
    }
  }

  required_version = ">= 1.3.6"

	backend "s3" {
    bucket = "gauntface-tfstate"
    key    = "gaunt.dev/twitterarchive/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = var.region
}
