# Routing Table for import_instance.tf file
resource "aws_route_table" "test_route_table_import_practice" {
  vpc_id = aws_vpc.test_vpc_import_practice.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =  "igw-06c5d2754ea266a47"                  # aws_internet_gateway.test-internet-gw.id
  }

  tags = {
    Name = "test-public-routing-table-for-import-practice"
  }
}

resource "aws_route_table" "test-public-routing-table-for-import-practice-2" {
  vpc_id = aws_vpc.test_vpc_import_practice.id
  route {
    cidr_block = "0.0.0.0/0"
    #    gateway_id = igw-06c5d2754ea266a47
  }

  tags = {
    Name = "test-public-routing-table-for-practice"
  }
}

resource "aws_subnet" "private-test-subnet-for-import-practice-3" {
  vpc_id                  = aws_vpc.test_vpc_import_practice.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "private test subnet for import practice-3"
  }
}