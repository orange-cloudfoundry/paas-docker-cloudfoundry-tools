terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.1"
    }
  }
  required_version = ">= 1.2.7"
}

