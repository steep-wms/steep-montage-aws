# Tank Terraform

Terraform workflow to AWS and Ansible Inventory file template

This repo uses submodules. For cloning use `git clone --recursive`.

The following steps are needed to setup a Tank database:

* You will need a working AWS CLI (setup using `aws configure`).
* Set necessary variables in `terraform.tfvars`. The docker login is needed to pull the tank image.
* Set number of nodes, instance_type or other variables as needed.
* `terraform init` to setup terraform environment
* `terraform apply` so setup infrastructre in AWS
* Wait until instances are running
* `cd tank-ansible && ansible-playbook -i aws-host site.yml` to provision tank and needed components on nodes.
* A simple NGINX load balancer is then running on the first EC2 instance.