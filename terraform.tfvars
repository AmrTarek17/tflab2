##### EC2 Values
image_id = "ami-03f8756d29f0b5f21"
instance_type = "t2.micro"
# public_ip = true
pub_instance_name = "pub-web-server"
priv_instance_name= "priv-web-server"
nginx_config= "nginx_config.sh"
##### Igw Values
igw_name = "main"

##### Public Subnet Values
public_supnet_cider = "10.0.0.0/24"
public_supnet_name = "pub-subnet"
availability_zone = "us-west-2a"

##### Public Subnet Values
private_supnet_cider = "10.0.1.0/24"
private_supnet_name = "priv-subnet"

##### VPC Values
vpc_cider = "10.0.0.0/16"
vpc_name = "my-vpc"

##### Nat gateway Values
nat_name = "ngw"

##### Public table Values
public_destination_cidr_block_ipv6 = "::/0"
public_destination_cidr_block = "0.0.0.0/0"
public_table_name = "pub-rout"

##### private table Values
private_destination_cidr_block = "0.0.0.0/0"
private_table_name = "priv-rout"

##### Security Groups Values
secgr_to_port_in = 80
secgr_from_port_in = 80
secgr_protocol_in = "tcp"
secgr_to_port_eg = 0
secgr_from_port_eg = 0
secgr_protocol_eg = "-1"
secgr_cider = ["0.0.0.0/0"]
secgr_name = "sec-grp"