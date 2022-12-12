resource "aws_vpc" "my-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
tags = {
    Name = "${var.project_name}-my-vpc"
  }
}
