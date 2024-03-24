resource "aws_vpc" "iacproject" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = var.instance_tenancy
    tags             = {
        Name = var.tags
    }
}

resource "aws_internet_gateway" "iacproject" {
    vpc_id = aws_vpc.iacproject.id
    tags   = {
        Name = var.tags
    }
}

data "aws_availability_zones" "available" {
}

resource "random_shuffle" "availability_zone_list" {
  input        = data.aws_availability_zones.available.names
  result_count = 2
}

resource "aws_subnet" "public_iacproject_subnet" {
    count                  = var.public_sn_count
    vpc_id                 = aws_vpc.iacproject.id
    cidr_block             = var.public_cidrs[count.index]
    map_public_ip_on_launch = var.map_public_ip_on_launch
    availability_zone      = random_shuffle.availability_zone_list.result[count.index]
    tags                   = {
        Name = var.tags
    }
}

resource "aws_subnet" "private_iacproject_subnet" {
    count                  = var.private_sn_count
    vpc_id                 = aws_vpc.iacproject.id
    cidr_block             = var.private_cidrs[count.index]
    map_public_ip_on_launch = false
    availability_zone      = random_shuffle.availability_zone_list.result[count.index]
    tags                   = {
        Name = var.tags
    }
}

resource "aws_default_route_table" "internal_iacproject_default" {
    default_route_table_id = aws_vpc.iacproject.default_route_table_id
    route {
        cidr_block = var.rt_route_cidr_block
        gateway_id = aws_internet_gateway.iacproject.id
    }
    tags = {
        Name = var.tags
    }
}

resource "aws_route_table_association" "default" {
    count          = var.public_sn_count
    subnet_id      = aws_subnet.public_iacproject_subnet[count.index].id
    route_table_id = aws_default_route_table.internal_iacproject_default.id
}

resource "aws_route_table" "private_iacproject_route_table" {
    vpc_id = aws_vpc.iacproject.id
    route {
        cidr_block      = var.rt_route_cidr_block
        nat_gateway_id  = aws_nat_gateway.nat_gateway.id
    }
    tags = {
        Name = var.tags
    }
}
resource "aws_route_table_association" "private" {
    count          = var.private_sn_count
    subnet_id      = aws_subnet.private_iacproject_subnet[count.index].id
    route_table_id = aws_route_table.private_iacproject_route_table.id
}

resource "aws_nat_gateway" "nat_gateway" {
    subnet_id     = aws_subnet.public_iacproject_subnet[0].id
    tags = {
        Name = var.tags
    }
}

resource "aws_security_group" "database_sg" {
  name        = "iacproject-database-sg" 
  vpc_id      = aws_vpc.iacproject.id 
  description = "Security group for the RDS database instance"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.app_security_group_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "iacproject-db-sg"
  }
}