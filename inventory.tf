data  "template_file" "aws" {
    template = "${file("./templates/hosts.tpl")}"
    vars = {
        jobmanager_nodes = "${join("\n", aws_instance.jobmanager.*.private_ip)}"
        mongodb_nodes = "${join("\n", aws_instance.mongodb.*.private_ip)}"
        mongodb_master = aws_instance.mongodb.0.private_ip
        mongodb_data_volume = aws_volume_attachment.mongodb.0.device_name
        mongodb_data_dir = "/opt/data/mongodb"
        glusterfs_brick_volume = aws_volume_attachment.glusterfs.0.device_name
        glusterfs_brick_dir = "/opt/data/brick"
        glusterfs_replicas = var.glusterfs_replicas
        proxy_node = aws_instance.gateway.public_dns
        docker_username = var.docker_username
        docker_password = var.docker_password
        bastion_node = aws_instance.gateway.public_dns
    }
}

resource "local_file" "aws_file" {
  content  = data.template_file.aws.rendered
  filename = "./ansible/hosts"
}
