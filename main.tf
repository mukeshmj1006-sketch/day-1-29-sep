resource "aws_vpc" "day1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "day1-vpc"
  }
}
# subnet
resource "aws_subnet" "day1" {
  vpc_id            = aws_vpc.day1.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "day1-subnet"
  }
}

resource "aws_internet_gateway" "day1" {
  vpc_id = aws_vpc.day1.id
  tags = {
    Name = "day1-igw"
  }
}

resource "aws_route_table" "day1" {
  vpc_id = aws_vpc.day1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day1.id
  }
  tags = {
    Name = "day1-rt"
  }
}

resource "aws_route_table_association" "day1" {
  subnet_id      = aws_subnet.day1.id
  route_table_id = aws_route_table.day1.id
}

resource "aws_security_group" "day1" {
  name        = "day1-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.day1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "day1" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.day1.id
  security_groups = [aws_security_group.day1.id]
  tags = {
    Name = "day1-instance"
  }
}