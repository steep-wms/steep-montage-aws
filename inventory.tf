data  "template_file" "aws" {
    template = "${file("./templates/hosts.tpl")}"
    vars = {
        jobmanager_nodes = "${join("\n", aws_instance.jobmanager.*.private_ip)}"
        cassandra_nodes = "${join("\n", aws_instance.cassandra.*.private_ip)}"
        number_of_seeds = "${var.number_of_cassandra_seeds}"
        proxy_node = aws_instance.gateway.public_dns
        docker_username = var.docker_username
        docker_password = var.docker_password
        cassandra_data_dir = "/opt/data/db"
        bastion_node = aws_instance.gateway.public_dns
    }
}

resource "local_file" "aws_file" {
  content  = "${data.template_file.aws.rendered}"
  filename = "./tank-ansible/aws-hosts"
}