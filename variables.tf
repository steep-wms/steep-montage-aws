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

variable "ec2_steep_instance_prefix" {
  description = "Name prefix for ec2 instances"
  default = "steep"
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

variable "steep_instance_type" {
  default = "m5.xlarge"
}

variable "mongodb_instance_type" {
  default = "m5.xlarge"
}

variable "ami_id" {
  # Ubuntu 18.04 LTS - HVM-SSD
  default = "ami-090f10efc254eaf55"
}

variable "steep_node_count" {
  # must be a multiple of 'glusterfs_replicas'
  default = "4"
}

variable "glusterfs_replicas" {
  default = "2"
}

variable "mongodb_node_count" {
  default = "1"
}

variable "steep_disk_size" {
  default = "10"
}

variable "glusterfs_disk_size" {
  # total size will be steep_node_count * glusterfs_disk_size / glusterfs_replicas
  default = "100"
}

variable "gateway_disk_size" {
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
