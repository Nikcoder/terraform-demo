# Create an EC2 instance
resource "aws_instance" "EC2_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id 
  vpc_security_group_ids = [var.security_id]

  tags = {
    Name = "Terraform_server"
  }
}

resource "aws_instance" "Bastion_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.pub_subnet_id
  vpc_security_group_ids      = [var.security_id]
  associate_public_ip_address = true
}

resource "aws_key_pair" "TF_Key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF_Key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}

output "instance_id" {
  value = aws_instance.EC2_server.id
}
