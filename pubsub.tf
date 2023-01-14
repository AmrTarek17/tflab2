resource "aws_subnet" "pub-sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.public_supnet_cider
  availability_zone = var.availability_zone

  tags = {
    Name = var.public_supnet_name
  }
}

resource "aws_eip" "nat" {
  vpc = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.pub-sub.id

  tags = {
    Name = var.nat_name
  }
  depends_on = [aws_internet_gateway.igw]
}

# resource "aws_gateway_attachment" "attach" {
#      vpc_id = "${aws_vpc.vpc.id}" 
#      internet_gateway_id = "${aws_internet_gateway.igw.id}" 
#      nat_gateway_ids = ["${aws_nat-gateway.ngw.id}"] 
#      }

resource "aws_route_table" "pub-rout" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    ipv6_cidr_block        = var.public_destination_cidr_block_ipv6
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = var.public_destination_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_table_name
  }
}

resource "aws_route_table_association" "priv-subass" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-rout.id
}



resource "aws_instance" "pub-web" {
 ami = var.image_id 
 associate_public_ip_address = true 
 instance_type = var.instance_type  
 
 subnet_id = aws_subnet.pub-sub.id
 vpc_security_group_ids = ["${aws_security_group.sec-grp.id}"]
 
 user_data = "${file(var.nginx_config)}"
   
 tags = {
   Name = var.pub_instance_name 
 }
 }