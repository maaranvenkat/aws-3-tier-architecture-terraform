# Internet Gateway 
resource "aws_internet_gateway" "my-internet-gateway" {
  vpc_id = aws_vpc.my-vpc.id
tags = {
    Name = "${var.project_name}-igw"
  }  
}