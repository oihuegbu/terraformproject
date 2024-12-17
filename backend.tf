terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    //bucket         	   = "uchicago-tfstate"
    bucket         	   = "pipeline-uchicago-bucket"                   //aws_s3_bucket.ucodepipeline_bucket.bucket
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "unichicagoTable"                      //aws_dynamodb_table.demo_table.name
  }
}