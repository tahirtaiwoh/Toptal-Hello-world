# Web Server Ec2 Instance 

resource "aws_instance" "web" {
    ami = "ami-006dcf34c09e50022"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.web_subnet.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true
    user_data = file("./scripts/user_data.sh")

    tags = {
      Name = "HelloWorld"
    }
  
}

# Security Group for Ec2 Web server Instance

resource "aws_security_group" "allow_tls" {
  name        = "web_server"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.web_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }

}