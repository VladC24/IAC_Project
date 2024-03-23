output "aws_public_subnet" {
  value = aws_subnet.public_iacproject_subnet.*.id
}

output "aws_private_subnet" {
  value = aws_subnet.private_iacproject_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.iacproject.id
}

output "private_subnet_a" {
  description = "The ID of the private subnet A"
  value       = aws_subnet.private_iacproject_subnet[0].id
}

output "private_subnet_b" {
  description = "The ID of the private subnet B"
  value       = aws_subnet.private_iacproject_subnet[1].id 
}

output "database_security_group_id" {
  value = aws_security_group.database_sg.id
}