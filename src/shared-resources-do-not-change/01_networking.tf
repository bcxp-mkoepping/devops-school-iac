resource "aws_default_vpc" "shared_vpc" {
}

resource "aws_vpc" "shared_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "shared_subnet_1" {
  vpc_id = aws_vpc.shared_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone_id = "euc1-az1"
}

resource "aws_subnet" "shared_subnet_2" {
  vpc_id = aws_vpc.shared_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone_id = "euc1-az2"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.shared_vpc.id
}

resource "aws_internet_gateway" "internet_gateway_default" {
  vpc_id = aws_default_vpc.shared_vpc.id
}