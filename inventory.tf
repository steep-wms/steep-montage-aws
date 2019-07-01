data  "template_file" "aws" {
    template = "${file("./templates/hosts.tpl")}"
    vars = {
        nodes = "${join("\n", aws_instance.tank.*.public_dns)}"
        nodes_comma = "${join(",", aws_instance.tank.*.private_dns)}"
        nodes_seeds = "${join(",", aws_instance.tank.*.private_dns)}"
        nodes_upstream = "server ${join(":8888; server ", aws_instance.tank.*.private_dns)}:8888;"
        proxy_node = aws_instance.tank[0].public_dns
        docker_username = var.docker_username
        docker_password = var.docker_password
    }
}

resource "local_file" "aws_file" {
  content  = "${data.template_file.aws.rendered}"
  filename = "./tank-ansible/aws-host"
}