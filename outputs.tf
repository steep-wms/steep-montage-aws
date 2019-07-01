output "ips" {
    value = "${join("\n", aws_instance.tank.*.public_dns)}"
}