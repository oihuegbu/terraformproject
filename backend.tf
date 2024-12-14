terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "uchicago-tfstate"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "uchicago_tf_lockid"
  }
}