# Internet gateway

resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    Name = "web"
  }
}


# Create route table

resource "aws_route_table" "web_route" {
  vpc_id = aws_vpc.web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id
  }

   tags = {
      Name = "web"
    }
}

# associate public subnet route table

resource "aws_route_table_association" "route_table_association" {
    subnet_id = aws_subnet.web_subnet.id
    route_table_id = aws_route_table.web_route.id
}