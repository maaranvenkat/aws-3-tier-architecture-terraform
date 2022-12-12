# Route Table
resource "aws_route_table" "my-public-web-route-table" {
    vpc_id = aws_vpc.my-vpc.id
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-internet-gateway.id
    }
tags = {
        Name = "${var.project_name}-public-web-route-table"
    }
}

resource "aws_route_table" "my-private-app-route-table" {
    vpc_id = aws_vpc.my-vpc.id
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-nat-gateway-1.id
    }
tags = {
        Name = "${var.project_name}-private-app-route-table"
    }
}

resource "aws_route_table" "my-private-database-route-table" {
    vpc_id = aws_vpc.my-vpc.id
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-nat-gateway-1.id
    }
tags = {
        Name = "${var.project_name}-private-database-route-table"
    }
}

#Route Table Association
resource "aws_route_table_association" "web1" {
  subnet_id      =aws_subnet.my-public-web-subnet-1.id
  route_table_id = aws_route_table.my-public-web-route-table.id
}

resource "aws_route_table_association" "web2" {
  subnet_id      =aws_subnet.my-public-web-subnet-2.id
  route_table_id = aws_route_table.my-public-web-route-table.id
}


resource "aws_route_table_association" "app1" {
  subnet_id      =aws_subnet.my-private-app-subnet-1.id
  route_table_id = aws_route_table.my-private-app-route-table.id
}

resource "aws_route_table_association" "app2" {
  subnet_id      =aws_subnet.my-private-app-subnet-2.id
  route_table_id = aws_route_table.my-private-app-route-table.id
}


resource "aws_route_table_association" "db1" {
  subnet_id      =aws_subnet.my-database-subnet-1.id
  route_table_id = aws_route_table.my-private-database-route-table.id
}

resource "aws_route_table_association" "db2" {
  subnet_id      =aws_subnet.my-database-subnet-2.id
  route_table_id = aws_route_table.my-private-database-route-table.id
}