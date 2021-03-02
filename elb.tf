# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "acme_elb" {
  name        = "acme_elb"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.acme_root.id

  tags = {
    Name = "acme_elb"
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


