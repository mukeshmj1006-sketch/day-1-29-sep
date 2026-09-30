output "instance_id" {
  value = aws_instance.day1.id 
  
}
output "instance_public_ip" {
  value = aws_instance.day1.public_ip
}
output "vpc_id" {
  value = aws_vpc.day1.id
}

output "instance_type" {
  value = aws_instance.day1.instance_type
  description = " EC2 instance type"
}