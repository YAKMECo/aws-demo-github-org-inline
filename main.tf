# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

# Create a VPC to launch our instances into
resource "aws_vpc" "acme_root" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "acme_root"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "acme_web" {
  vpc_id                  = aws_vpc.acme_root.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "acme_web"
  }
}




