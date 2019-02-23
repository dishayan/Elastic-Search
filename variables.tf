variable "aws_region" {
  description = "Region for the ElasticSearch VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the ElasticSearch VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI with elastic search installed - Debasish"
  default = "ami-05e5c3e106ba751b8"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/dishayan/.ssh/elasticsearch_id_rsa.pub"
}
