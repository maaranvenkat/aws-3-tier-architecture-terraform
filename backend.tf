terraform {
  backend "s3" {
    bucket = "maaran-aws-infra-tf-backend"
    key    = "awsinfra/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}