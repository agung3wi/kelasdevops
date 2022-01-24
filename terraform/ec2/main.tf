terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70"
    }
  }

}

provider "aws" {
  profile = "default"
  region = "ap-southeast-3"
}

variable "instance_tags" {
  type = list
  default = ["worker-1", "worker-2"]
}

resource "aws_instance" "app_server" {
  count = 2
  ami           = "ami-0a9c8e0ccf1d85f67"
  instance_type = "t3.micro"
  subnet_id = "subnet-04fc1b6d9cd6df09e"
  vpc_security_group_ids = ["sg-0186874d7b36b13ec"]
  key_name = "kelasdevops"

  tags = {
    Name = element(var.instance_tags, count.index)
  }
}