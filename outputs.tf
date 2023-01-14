output "public_ec2_ip"{
    description = "get public ip"
    value = aws_instance.pub-web.public_ip
}

output "private_ec2_ip"{
    description = "get private ip"
    value = aws_instance.priv-web.private_ip
}