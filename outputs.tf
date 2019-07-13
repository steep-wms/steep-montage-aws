output "ips" {
    value = "${aws_instance.gateway.public_dns}"
}