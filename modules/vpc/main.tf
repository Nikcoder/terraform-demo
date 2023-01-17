resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
# Public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.az_zone1

  tags = {
    Name = var.pub_subnet_name
  }
}

#Public subnet in second az
resource "aws_subnet" "PublicSubnet2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pub_subnet_cidr
  availability_zone = var.az_zone2

  tags = {
    Name = var.pub_subnet_name_2
  }
}


# Private subnet
resource "aws_subnet" "PrivateSubnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri_subnet_cidr
  availability_zone = var.az_zone1

  tags = {
    Name = var.pri_subnet_name
  }
}

# Private subnet in second az
resource "aws_subnet" "PrivateSubnet2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri_subnet_cidr2
  availability_zone = var.az_zone2

  tags = {
    Name = var.pri_subnet_name2
  }
}



output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnet_id" {
  value = aws_subnet.PublicSubnet.id
}

output "pub_subnet_id" {
  value = aws_subnet.PublicSubnet2.id
}

output "subnet_private_id" {
  value = aws_subnet.PrivateSubnet.id
}

output "subnet_private_id2" {
  value = aws_subnet.PrivateSubnet2.id
}

