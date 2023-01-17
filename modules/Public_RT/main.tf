# Create a route table for public subnet
resource "aws_route_table" "PublicRT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.igw_cidr
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "Terraform_Public_RT"
  }
}

# Create a route table association
resource "aws_route_table_association" "Public_association" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}

# Create a route table association
resource "aws_route_table_association" "Public_association2" {
  subnet_id      = var.pub_subnet_id
  route_table_id = var.route_table_id
}

output "route_table_id" {
  value = aws_route_table.PublicRT.id
}
