terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "pipeline-uchicago-tfstate"                   //aws_s3_bucket.ucodepipeline_bucket.bucket
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "unichicago"                      //aws_dynamodb_table.demo_table.name
  }
}