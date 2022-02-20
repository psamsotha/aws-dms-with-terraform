
output "ec2_public_dns" {
  value = aws_instance.mysql_client.public_dns
}

output "ec2_public_ip" {
  value = aws_instance.mysql_client.public_ip
}
