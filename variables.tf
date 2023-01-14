##### EC2 Variables
# variable "user_data" {
#   default = <<-EOF
#   #!/bin/bash
#   echo "*** Installing apache2"
#   sudo apt update -y
#   sudo apt install apache2 -y
#   echo "*** Completed Installing apache2"
#   EOF
# }
variable "image_id" {
}
variable "instance_type" {
}
variable "nginx_config" {
}
# variable "public_ip" {
# }
variable "pub_instance_name" {
}

variable "priv_instance_name" {
}
##### Igw Variables
variable "igw_name" {
}

##### Public Subnet Variables
variable "public_supnet_cider" {
}
variable "public_supnet_name" {
}

variable "availability_zone" {
}

##### Private Subnet Variables
variable "private_supnet_cider" {
}
variable "private_supnet_name" {
}

##### VPC Variables
variable "vpc_cider" {
}
variable "vpc_name" {
}

##### Nat Gateway Variables
variable "nat_name" {
}

##### Public table Variables
variable "public_destination_cidr_block" {
}
variable "public_table_name" {
}

##### Private table Variables
variable "private_destination_cidr_block" {
}
variable "private_table_name" {
}
variable "public_destination_cidr_block_ipv6" {
}

##### Security Groups Variables
variable "secgr_to_port_in" {
}
variable "secgr_from_port_in" {
}
variable "secgr_to_port_eg" {
}
variable "secgr_from_port_eg" {
}
variable "secgr_cider" {
}
variable "secgr_name" {
}
variable "secgr_protocol_in" {
}
variable "secgr_protocol_eg" {
}
