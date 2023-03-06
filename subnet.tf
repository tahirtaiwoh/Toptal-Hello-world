# Create Subnet for web
resource "aws_subnet" "web_subnet" {
    vpc_id = aws_vpc.web_vpc.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true

    tags = {
      Name = "web_subnet"
    }
  
}