resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cider
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_security_group" "sec-grp" {
  name        = var.secgr_name
#   description = "public security group"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port   = var.secgr_from_port_in
    to_port     = var.secgr_to_port_in
    protocol    = var.secgr_protocol_in
    cidr_blocks = var.secgr_cider
  }

  egress {
    from_port        = var.secgr_from_port_eg
    to_port          = var.secgr_to_port_eg
    protocol         = var.secgr_protocol_eg
    cidr_blocks      = var.secgr_cider
  }


#   tags = {
#       Name        = "security-group"
#       Environment = "production"
#   }              
}
