#Fetch AMI ID

data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

# Bastion Host
resource "aws_instance" "bastion-server" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = var.keypair_name
  vpc_security_group_ids      = [aws_security_group.bastion-server-sg.id]
  subnet_id                   = aws_subnet.my-public-web-subnet-1.id
  associate_public_ip_address = true
tags = {
    Name = "${var.project_name}-bastion-server"
  }
}

# EC2 instance in App Subnet
resource "aws_instance" "my-app-server-1" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = var.keypair_name
  vpc_security_group_ids      = [aws_security_group.app-server-sg.id]
  subnet_id                   = aws_subnet.my-private-app-subnet-1.id
  associate_public_ip_address = false
  user_data                   = file("./modules/data.sh")
tags = {
    Name = "${var.project_name}-app-server-1"
  }
}

resource "aws_instance" "my-app-server-2" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = var.keypair_name
  vpc_security_group_ids      = [aws_security_group.app-server-sg.id]
  subnet_id                   = aws_subnet.my-private-app-subnet-2.id
  associate_public_ip_address = false
  user_data                   = file("./modules/data.sh")
tags = {
    Name = "${var.project_name}-app-server-2"
  }
}