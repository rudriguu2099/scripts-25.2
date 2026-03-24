output "cliente_public_ip" {
  description = "IP público do cliente"
  value       = aws_instance.cliente.public_ip
}

output "banco_private_ip" {
  description = "IP privado do banco"
  value       = aws_instance.banco.private_ip
}

output "cliente_id" {
  description = "ID do cliente"
  value       = aws_instance.cliente.id
}

output "banco_id" {
  description = "ID do banco"
  value       = aws_instance.banco.id
}
