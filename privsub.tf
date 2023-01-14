resource "aws_subnet" "priv-sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.private_supnet_cider
  availability_zone = var.availability_zone

  tags = {
    Name = var.private_supnet_name
  }
}

resource "aws_route_table" "priv-rout" {
  vpc_id = aws_vpc.my-vpc.id

#   route {
#     ipv6_cidr_block        = "::/0"
#     nat_gateway_id = aws_nat_gateway.ngw.id
#   }

  route {
    cidr_block = var.private_destination_cidr_block
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = var.private_table_name
  }
}

resource "aws_route_table_association" "pub-subass" {
  subnet_id      = aws_subnet.priv-sub.id
  route_table_id = aws_route_table.priv-rout.id
}


resource "aws_instance" "priv-web" {
 ami = var.image_id 
#  associate_public_ip_address = true 
 instance_type = var.instance_type  
 
 subnet_id = aws_subnet.priv-sub.id
 vpc_security_group_ids = ["${aws_security_group.sec-grp.id}"]
 
 user_data = "${file(var.nginx_config)}"
   
 tags = {
   Name = var.priv_instance_name 
 }
 depends_on = [aws_nat_gateway.ngw]
 }