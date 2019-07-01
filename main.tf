provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.region}"
}

locals {
  create_vpc = "${var.vpc_id == "" ? 1 : 0}"
}

data "aws_vpc" "vpc" {
  count = "${1 - local.create_vpc}"

  id = "${var.vpc_id}"
}

# resource "aws_vpc" "subnet" {
#   count = "${local.create_vpc}"

#   cidr_block = "${var.cidr}"

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_internet_gateway" "selected" {
#   count = "${1 - local.create_vpc}"

#   vpc_id = "${data.aws_vpc.selected[count.index].id}"
# }

# resource "aws_internet_gateway" "this" {
#   count = "${local.create_vpc}"

#   vpc_id = "${aws_vpc.this[count.index].id}"
# }

# Define the public subnet
resource "aws_subnet" "subnet" {
  vpc_id = "${data.aws_vpc.vpc[0].id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "Web Public Subnet"
  }
}

resource "aws_instance" "tank" {
  ami           = "ami-090f10efc254eaf55"
  instance_type = "${var.instance_type}"
  count = "${var.node_count}"
  key_name = "${var.keypair}"
  tags = {
    Name = "${var.ec2_instance_prefix}-${count.index}"
  }
  vpc_security_group_ids = [ "sg-0621b73dae2aec4a0", "sg-087617d2b7d529eee" ]
  associate_public_ip_address = true
  subnet_id = "${aws_subnet.subnet.id}"
  ebs_block_device {
    volume_type = "standard"
    volume_size = "${var.disk_size}"
    device_name = "/dev/sda1"
    delete_on_termination = true
  }
}