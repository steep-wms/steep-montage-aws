# JobManager3 Montage Terraform AWS

Terraform workflow to AWS and Ansible Inventory file template

This repo uses submodules. For cloning use `git clone --recursive`.

The following steps are needed to setup a JobManager3 with Montage:

* You will need a working AWS CLI (setup using `aws configure`).
* Set necessary variables in `terraform.tfvars`. The docker login is needed to pull the jobmanager3-montage image.
* Keyfile `~/.ssh/id_rsa` is used by default, otherwise set `keyfile` variable in `.tfvars`.
* Set number of nodes, instance_type or other variables as needed.
* `terraform init` to setup terraform environment
* `terraform apply` so setup infrastructre in AWS
* Wait until instances are running
* `ansible-playbook -i ./tank-ansible/aws-hosts tank-ansible/site.yml` to provision JobManager3 on nodes.
* `terraform state show aws_instance.gateway` prints the state including the FQDN (public_dns) of the public endpoint.

IMPORTANT: don't forget to destroy after experiment:  
`terraform destroy`