# Create a route table for private subnet
resource "aws_route_table" "PrivateRT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.nat_cidr
    gateway_id = var.nat_id
  }
  tags = {
    Name = "Terraform_Private_RT"
  }
}

# Create a route table association
resource "aws_route_table_association" "Private_association" {
  subnet_id      = var.subnet_private_id
  route_table_id = var.route_id_private
}

# Create a route table association
resource "aws_route_table_association" "Private_association2" {
  subnet_id      = var.subnet_private_id2
  route_table_id = var.route_id_private
}


output "route_id_private" {
  value = aws_route_table.PrivateRT.id
}

