output "server-public-ip" {
  value = aws_instance.capstone-server.public_ip
  description = "Public Ip of capstone server"
}

output "server-public-dns" {
  value = aws_instance.capstone-server.public_dns
  description = "Public DNS of capstone server"
}

output "ssh_command" {
  value       = "ssh -i ${var.ec2_key_pair}.pem ec2-user@${aws_instance.capstone-server.public_ip}"
  description = "SSH command to connect to server"
}