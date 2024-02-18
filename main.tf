provider "aws" {  // provider allows to create any resources we want to create on AWS or Azure or GCP or Oracle.
      region = "eu-west-2"
}

resource "aws_vpc" "myvpc" { // The resource we want to create is aws vpc with cidr block 10.0.0.0/16
      cidr_block = "10.0.0.0/16"
}