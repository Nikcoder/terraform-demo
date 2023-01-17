# Create ElasticIP for NAT gateway
resource "aws_eip" "nat1" {
  vpc = true
}

# Create a NAT gateway
resource "aws_nat_gateway" "Nat_Gateway" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name = "Terraform_NAT_Gateway"
  }
}

output "allocation_id" {
  value = aws_eip.nat1.id
}

output "nat_id" {
  value = aws_nat_gateway.Nat_Gateway.id
}

