terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "aws_architecture" {
    source = "./modules"
    region_name = ""
    project_name = "Gitlab-Architecture"
    vpc_cidr = "172.30.0.0/20"
    subnet1_cidr = "172.30.1.0/24"
    subnet2_cidr = "172.30.2.0/24"
    subnet3_cidr = "172.30.3.0/24"
    subnet4_cidr = "172.30.4.0/24"
    subnet5_cidr = "172.30.5.0/24"
    subnet6_cidr = "172.30.6.0/24"
    keypair_name = ""
}