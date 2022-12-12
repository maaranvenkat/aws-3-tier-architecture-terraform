# EIP
resource "aws_eip" "my-new-eip" {
  vpc = true
  
  tags = {
    Name = "${var.project_name}-EIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "my-nat-gateway-1" {
  allocation_id = aws_eip.my-new-eip.id
  subnet_id     = aws_subnet.my-public-web-subnet-1.id

  tags = {
    Name = "${var.project_name}-nat-gateway"
  }
}