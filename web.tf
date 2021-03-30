
# Our default security group to access....
# the instances over SSH and HTTP (s) 
resource "aws_security_group" "acme_web" {
  name        = "acme_web"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.acme_root.id

  tags = {
    Name = "acme_web"
  }

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC - changed
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


resource "aws_security_group" "add-sec-sg" {
  name        = "add-sec-sg"
  description = "add-sec-sg"
  vpc_id      = aws_vpc.acme_root.id

  tags = {
    Name = "add-sec-sg"
  }
}

resource "aws_security_group" "default" {
  name        = "default"
  description = "default VPC security group"
  vpc_id      = "${aws_vpc.acme_root.id}"

  tags = {
    Name = "default-ignore"
  }
}

