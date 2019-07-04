data  "template_file" "aws" {
    template = "${file("./templates/hosts.tpl")}"
    vars = {
        nodes = "${join("\n", aws_instance.tank.*.public_dns)}"
        number_of_seeds = "${var.number_of_cassandra_seeds}"
        proxy_node = aws_instance.tank[0].public_dns
        docker_username = var.docker_username
        docker_password = var.docker_password
    }
}

resource "local_file" "aws_file" {
  content  = "${data.template_file.aws.rendered}"
  filename = "./tank-ansible/aws-host"
}