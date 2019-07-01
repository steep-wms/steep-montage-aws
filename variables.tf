variable "vpc_id" {
  description = "Existing VPC to use (specify this, if you don't want to create new VPC)"
  default     = "vpc-0df0c95aa69714e16"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The Subnet CIDR block for the VPC."
  default     = "10.0.2.0/24"
}

variable "ec2_instance_prefix" {
  description = "Name prefix for ec2 instances"
  default = "tank"
}

variable "region" {
  default = "eu-central-1"
}

variable "keypair" {
  description = "Keypair to use for EC2 Instances"
}

variable "aws_profile" {
  description = "Local aws profile to use for provisioning resoources"
  default = "default"
}

variable "instance_type" {
  default = "m5.xlarge"
}

variable "ami_id" {
  # Ubuntu 18.04 LTS - HVM-SSD
  default = "ami-090f10efc254eaf55"
}

variable "node_count" {
  default = "3"
}

variable "disk_size" {
  default = "10"
}

variable "docker_username" {
  default = ""
}

variable "docker_password" {
  default = ""
}