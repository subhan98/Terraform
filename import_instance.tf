#resource "aws_instance" "Testing-Import-Command" {
#  ami           = "ami-07c1b39b7b3d2525d"
#  instance_type = "t2.micro"
#
#}
#  region = "eu-west-2"
#  volume_tags = {
#    volume = "gp3"
#  }

resource "aws_vpc" "test_vpc_import_practice" {
  cidr_block           = "172.31.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
#  id = "02778be74df25591f"
  tags = {
    Name = "test_vpc_import_practice"
  }
# enable_classic_link   = "false"


}
# Private Subnets in test VPC

resource "aws_subnet" "test_subnet_import_practice" {
  vpc_id                  = aws_vpc.test_vpc_import_practice.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "private test subnet for import practice"
  }
}

resource "aws_subnet" "private-test-subnet-for-import-practice-2" {
  vpc_id                  = aws_vpc.test_vpc_import_practice.id
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2b"

  tags = {
    Name = "private test subnet for import practice-2"
  }
}

resource "aws_internet_gateway" "test-internet-gw-import" {
  vpc_id = aws_vpc.test_vpc_import_practice.id

}

resource "aws_default_network_acl" "test_aws_network_acl_import" {
#  subnet_id      = aws_subnet.test_subnet-1.id
#  route_table_id = aws_route_table.test-public-routing-table-for-import-practice-2.id
#  vpc_id         = aws_vpc.test_vpc_import_practice.id
  default_network_acl_id = "acl-0c3c44d5136faa1f4"
}

#resource "aws_route_table_association" "test_route_table_association" {
##  subnet_id      = aws_subnet.test_subnet-1.id
#  route_table_id = aws_route_table.test-public-routing-table-for-import-practice-2.id
#}



