resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name= "${var.env}-my-new-vpc"
  }
}

# public subnets
resource "aws_subnet" "public-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name= "${var.env}-public-subnet-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name="${var.env}-public-subnet-2"
  }
}

# internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name="${var.env}-igw"
  }
}

# route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block= "0.0.0.0/0"
    gateway_id=aws_internet_gateway.main.id
  }
}

# route table association
resource "aws_route_table_association" "public-1" {
  subnet_id = aws_subnet.public-1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id = aws_subnet.public-2.id
  route_table_id = aws_route_table.public.id
}
