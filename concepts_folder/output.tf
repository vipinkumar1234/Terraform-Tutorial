output "Private_ip" {
    value = aws_instance.MyInstance.Private_ip
    description = "This is my EC2 private ip"
  
}