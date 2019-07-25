variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "The Private Subnet CIDR block for the VPC."
  default     = "10.0.2.0/24"
}

variable "public_subnet_cidr" {
  description = "The Public Subnet CIDR block for the VPC."
  default     = "10.0.3.0/24"
}

variable "ec2_jobmanager_instance_prefix" {
  description = "Name prefix for ec2 instances"
  default = "jobmanager"
}

variable "ec2_mongodb_instance_prefix" {
  description = "Name prefix for ec2 instances"
  default = "mongodb"
}

variable "region" {
  default = "eu-central-1"
}

variable "keypair" {
  description = "Keypair to use for EC2 Instances"
}

variable "keyfile" {
  description = "Private key to use for ssh auth"
  default = "~/.ssh/id_rsa"
}

variable "aws_profile" {
  description = "Local aws profile to use for provisioning resoources"
  default = "default"
}

variable "gateway_instance_type" {
  default = "m5.xlarge"
}

variable "jobmanager_instance_type" {
  default = "m5.xlarge"
}

variable "mongodb_instance_type" {
  default = "m5.xlarge"
}

variable "ami_id" {
  # Ubuntu 18.04 LTS - HVM-SSD
  default = "ami-090f10efc254eaf55"
}

variable "jobmanager_node_count" {
  default = "3"
}

variable "mongodb_node_count" {
  default = "3"
}

variable "jobmanager_disk_size" {
  default = "10"
}

variable "mongodb_disk_size" {
  default = "10"
}

variable "docker_username" {
  default = ""
}

variable "docker_password" {
  default = ""
}
