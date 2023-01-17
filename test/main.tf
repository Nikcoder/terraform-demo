module "vpc" {
  source            = "../modules/vpc"
  vpc_cidr          = "10.1.0.0/16"
  vpc_name          = "Terraform_vpc"
  subnet_cidr       = "10.1.12.0/24"
  az_zone1          = "us-east-2a"
  pri_subnet_cidr   = "10.1.24.0/24"
  pub_subnet_name   = "Terraform_public_subnet"
  pri_subnet_name   = "Terraform_private_subnet"
  vpc_id            = "module.vpc.vpc_id"
  az_zone2          = "us-east-2b"
  pub_subnet_name_2 = "Terraform_public_subnet_2"
  pub_subnet_cidr   = "10.1.48.0/24"
  pri_subnet_name2  = "Terraform_private_subnet_2"
  pri_subnet_cidr2  = "10.1.56.0/24"
}

module "InternetGW" {
  source = "../modules/IGW"
  vpc_id = "module.vpc.vpc_id"
}

module "NAT_Gateway" {
  source        = "../modules/NAT"
  allocation_id = "module.NAT_Gateway.allocation_id"
  subnet_id     = "module.vpc.subnet_id"
}

module "public_route" {
  source         = "../modules/Public_RT"
  igw_cidr       = "0.0.0.0/0"
  gateway_id     = "module.InternetGW.gateway_id"
  subnet_id      = "module.vpc.subnet_id"
  pub_subnet_id  = "module.vpc.pub_subnet_id"
  route_table_id = "module.public_route.route_table_id"
  vpc_id         = "module.vpc.vpc_id"
}

module "private_route" {
  source             = "../modules/Private_RT"
  nat_cidr           = "0.0.0.0/0"
  nat_id             = "module.NAT_Gateway.nat_id"
  subnet_private_id  = "module.vpc.subnet_private_id"
  route_id_private   = "module.private_route.route_id_private"
  vpc_id             = "module.vpc.vpc_id"
  subnet_private_id2 = "module.vpc.subnet_private_id2"
}

module "ec2_instance" {
  source        = "../modules/ec2"
  ami_id        = "ami-0ff39345bd62c82a5"
  instance_type = "t3.micro"
  subnet_id     = "module.vpc.subnet_id"
  security_id   = "module.ec2_sg.security_id"
  pub_subnet_id = "module.vpc.pub_subnet_id"
}

module "ec2_sg" {
  source        = "../modules/securitygroups"
  vpc_id        = "module.vpc.vpc_id"
}

module "load_balancer" {
  source        = "../modules/loadbalancer"
  alb_name      = "Terraform_load_balancer" 
  subnet_id     = "module.vpc.subnet_id"
  pub_subnet_id = "module.vpc.pub_subnet_id"
  security_id   = "module.ec2_sg.security_id"
  vpc_id        = "module.vpc.vpc_id"
  instance_id   = "module.ec2_instance.instance_id"
}


