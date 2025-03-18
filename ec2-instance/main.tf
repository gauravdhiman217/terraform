terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"

    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = "cli-user"
}


resource "aws_instance" "myInstance" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"

    tags = {
        Name = "My Instance"
    }

}

