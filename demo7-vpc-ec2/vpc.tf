resource "aws_vpc" "varun-vpc" {
  cidr_block           = "10.50.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "varun-vpc"
  }
}

resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.varun-vpc.id
  cidr_block              = "10.50.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"
  tags = {
    Name = "varun-subnet-public1"
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id            = aws_vpc.varun-vpc.id
  cidr_block        = "10.50.11.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "varun-subnet-private1"
  }
}

resource "aws_subnet" "subnet-public-2" {
  vpc_id                  = aws_vpc.varun-vpc.id
  cidr_block              = "10.50.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2b"
  tags = {
    Name = "varun-subnet-public-2"
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id            = aws_vpc.varun-vpc.id
  cidr_block        = "10.50.12.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "varun-subnet-private-2"
  }
}

resource "aws_internet_gateway" "varun-igw" {
  vpc_id = aws_vpc.varun-vpc.id
  tags = {
    Name = "varun-igw"
  }
}

resource "aws_route_table" "varun-public-route" {
  vpc_id = aws_vpc.varun-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.varun-igw.id
  }

  tags = {
    Name = "varun-public-route"
  }
}

resource "aws_route_table_association" "varun-route-public-subnet-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.varun-public-route.id
}


resource "aws_security_group" "varun-security-group" {
  vpc_id = aws_vpc.varun-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = ["117.200.104.99/32"]
  }
  //If you do not add this rule, you can not reach the NGIX  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "varun-security-group"
  }
}