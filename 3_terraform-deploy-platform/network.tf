resource "aws_vpc" "workshop0001-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-workshop0001"
	Project = "Amplify UKI Workshop0001"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.workshop0001-main.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  tags = {
    Name = "AxwayTechlab-workshop0001"
	Project = "Amplify UKI Workshop0001"
  }
}

resource "aws_subnet" "workshop0001-main" {
  vpc_id     = aws_vpc.workshop0001-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
	Project = "Amplify UKI Workshop0001"
  }
}

resource "aws_internet_gateway" "workshop0001-gw" {
  vpc_id = aws_vpc.workshop0001-main.id

  tags = {
    Name = "AxwayTechlab"
	Project = "Amplify UKI Workshop0001"
  }
}

resource "aws_main_route_table_association" "workshop0001-a" {
  vpc_id         = aws_vpc.workshop0001-main.id
  route_table_id = aws_route_table.workshop0001-rt.id
 
  
}


resource "aws_route_table" "workshop0001-rt" {
  vpc_id = aws_vpc.workshop0001-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.workshop0001-gw.id
  }


  tags = {
    Name = "workshop0001-AxwayTechlab"
	Project = "Amplify UKI Workshop0001"

  }
}


























