output "ips" {
    value = "${join(",", aws_instance.tank.*.public_dns)}"
}