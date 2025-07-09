provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.2.0"
    }
  }
  /*
  backend "s3" {
    bucket         = "naveen-terraform-state-files"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  #enabling state locking, so no concurrent changes and no state corruption  
    use_lockfile = true  
  }
  */
}