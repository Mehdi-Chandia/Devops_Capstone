variable "aws_region" {
  description = "AWS region"
  default = "ap-south-1"
  type = string
}

variable "env" {
  description = "AWS enviroment"
  default = "dev"
  type = string
}

variable "ec2_ami" {
  description = "AWS EC2 ami id"
  default = "ami-0f58b397bc5c1f2e8"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
  type = string
}

variable "ec2_key_pair" {
  description = "Key pair"
  default = "nexus-key"
  type = string
}

variable "docker_username" {
  default = "mehdy313"
  type = string
}