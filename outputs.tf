output "ip" {
    value = "${join(",", aws_instance.tank.*.public_ip)}"
}