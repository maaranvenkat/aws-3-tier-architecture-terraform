data "aws_availability_zones" "az_zone" {}

# public-web-subnet-1
resource "aws_subnet" "my-public-web-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block             = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.az_zone.names[0]
tags = {
    Name = "${var.project_name}-public-web-subnet-1"
  }
}
# public-web-subnet-2
resource "aws_subnet" "my-public-web-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block             = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.az_zone.names[1]
tags = {
    Name = "${var.project_name}-public-web-subnet-2"
  }
}

# private-app-subnet-1
resource "aws_subnet" "my-private-app-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block             = var.subnet3_cidr
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.az_zone.names[0]
tags = {
    Name = "${var.project_name}-private-app-subnet-1"
  }
}
# private-app-subnet-2 
resource "aws_subnet" "my-private-app-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block             = var.subnet4_cidr
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.az_zone.names[1]
tags = {
    Name = "${var.project_name}-private-app-subnet-2"
  }
}

# database-subnet-1
resource "aws_subnet" "my-database-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = data.aws_availability_zones.az_zone.names[0]
tags = {
    Name = "${var.project_name}-database-subnet-1"
  }
}
# database-subnet-2
resource "aws_subnet" "my-database-subnet-2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = data.aws_availability_zones.az_zone.names[1]
tags = {
    Name = "${var.project_name}-database-subnet-2"
  }
}