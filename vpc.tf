# Define our VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "ElasticSearch-vpc"
  }
}
# Define the public subnet
resource "aws_subnet" "elastcisearch-public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "ElasticSearch Public Subnet"
  }
}
# Define the internet gateway
resource "aws_internet_gateway" "elastcisearch-gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "ElasticSearch VPC IGW"
  }
}
# Define the route table
resource "aws_route_table" "elastcisearch-public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.elastcisearch-gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "elastcisearch-public-rt" {
  subnet_id = "${aws_subnet.elastcisearch-public-subnet.id}"
  route_table_id = "${aws_route_table.elastcisearch-public-rt.id}"
}
# Define the security group for public subnet
resource "aws_security_group" "elastcisearch-sg" {
  name = "ElasticSearch-SG"
  description = "All access"
  

    ingress {
    from_port = 22
    to_port = 65535
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
    egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  vpc_id="${aws_vpc.default.id}"

  tags {
    Name = "ElasticSearch SG"
  }
}
# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "elasticsearch_id"
  public_key = "${file("${var.key_path}")}"
}
# Define ElasticSearch server inside the public subnet
resource "aws_instance" "elastcisearch-inst" {
   ami  = "${var.ami}"
   instance_type = "t3.2xlarge"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.elastcisearch-public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.elastcisearch-sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("user_data.sh")}"
  tags {
    Name = "elastcisearchserver"
  }
}
