# Create a Internet Gateway
resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Terraform_Internet_Gateway"
  }
}

output "gateway_id" {
  value = aws_internet_gateway.Internet_Gateway.id
}

