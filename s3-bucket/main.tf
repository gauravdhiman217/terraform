terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"

    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_id" "random_id" {
  byte_length = 8
}

provider "aws" {
  region = "us-east-1"
  profile = "cli-user"
  
}

resource "aws_s3_bucket" "myBucket" {
    bucket = "my-unique-bucket-name-${random_id.random_id.hex}"
    
    tags = {
        Name = "My bucket"
    }
  
}