terraform {

  cloud {
    organization = "terraform-guru-aboali"

    workspaces {
      name = "terraform-cloud-guru"
    }
  }

  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.25"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}


module "ec2-psacg" {
  source        = "git::https://github.com/mohamedaboali10/terraform-as-ec2-psacg.git"
  instance_count = var.instance_count
  ami            = var.ami
  instance_type  = var.instance_type
  subnet         = var.subnet
}



variable "instance_count" {}

variable "ami" {}

variable "instance_type" {}

variable "subnet" {}

output "aws_instances" {
  value = module.ec2-psacg.*.aws_instances
}
