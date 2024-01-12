terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
  backend "s3" {
    bucket         	   = "terraform-assignment-s3-state"
    key              	   = "state/terraform.tfstate"
    region         	   = "eu-west-1"
    encrypt        	   = true
    dynamodb_table = "tf_lockID"
  }
}
provider "aws" {
    region = "eu-west-1"
}